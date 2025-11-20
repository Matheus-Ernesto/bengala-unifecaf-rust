import time
import asyncio
import aiohttp

class DetectorEnvio:
    def __init__(self, url_php, cooldown=20, threshold=0.80):
        self.url_php = url_php          # endpoint PHP
        self.cooldown = cooldown        # segundos
        self.threshold = threshold      # confiança mínima
        self.ultima_foto = 0            # timestamp da última foto enviada

    # -----------------------
    # Recebe *somente os resultados* vindos do YOLO
    # -----------------------
    def extrair_score_person(self, resultados):
        maior = 0.0
        if not resultados:
            return maior

        for obj in resultados:
            if obj["classe"] == "person":
                if obj["confianca"] > maior:
                    maior = obj["confianca"]

        return maior

    # -----------------------
    # Envia imagem para PHP
    # -----------------------
    async def enviar_para_php(self, img_path):
        print("Indo enviar a imagem para o site")
        try:
            async with aiohttp.ClientSession() as session:
                with open(img_path, "rb") as img:
                    data = {"imagem": img}
                    async with session.post(self.url_php, data=data) as r:
                        print("Resposta PHP:", await r.text())
        except Exception as e:
            print("Erro ao enviar:", e)

    # -----------------------
    # Função principal -> usa apenas os resultados já prontos do YOLO
    # -----------------------
    async def processar(self, resultados_yolo, img_path):
        agora = time.time()

        # respeita cooldown
        if agora - self.ultima_foto < self.cooldown:
            return False

        # pega confiança de "person"
        score = self.extrair_score_person(resultados_yolo)

        # verifica limiar
        if score >= self.threshold:
            print("[DetectorEnvio] Enviando imagem...")
            await self.enviar_para_php(img_path)
            self.ultima_foto = agora
            return True

        return False