import os
from ultralytics import YOLO
import torch
import sys
import gc

# Configura o nível de log da biblioteca ultralytics para não exibir mensagens
import logging
logging.getLogger("ultralytics").setLevel(logging.CRITICAL)

from contextlib import contextmanager

# Função para ocultar prints
# Esta função redireciona a saída padrão para um arquivo nulo (devnull) para ocultar prints
@contextmanager
def ocultar_prints():
    stdout_original = sys.stdout
    stderr_original = sys.stderr
    sys.stdout = open(os.devnull, 'w')
    sys.stderr = open(os.devnull, 'w')
    try:
        yield
    finally:
        sys.stdout.close()
        sys.stderr.close()
        sys.stdout = stdout_original
        sys.stderr = stderr_original

# Função para verificar se o modelo já foi carregado
# Esta função verifica se o modelo já foi carregado e, se não, carrega o modelo
class Yolo:
    def __init__(self):
        # Define o modelo a ser utilizado
        self.modelo = "yolov5nu.pt"
        # Variável que armazenará o modelo carregado
        self._model = None

    # Método para treinar o modelo
    # Este método treina o modelo YOLO com os parâmetros fornecidos
    def treinar(self, yaml, qualidade, fatoracao):
        # Carrega o modelo base
        self._model = YOLO(os.path.join("bengalaFecaf","weights",self.modelo))

        # Define se o treinamento usará CUDA (GPU) se disponível, se não usará CPU
        device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        print(f"Usando dispositivo: {device}")

        # Treinamento do modelo
        train_results = self._model.train(
            data=yaml,                          # Arquivo com caminho dos dados
            epochs=fatoracao,                   # Número de épocas de treinamento
            imgsz=qualidade,                    # Tamanho da imagem
            device=device,                      # Dispositivo usado
            project="bengalaFecaf/training",    # Local para salvar os resultados
            name="train"                        # Nome do experimento
        )

        # Avaliação do modelo após o treinamento
        metrics = self._model.val()

        return None
    
    # Método para carregar o modelo treinado na memória
    # Este método carrega o modelo YOLO com os pesos fornecidos
    def carregar(self):
        with ocultar_prints():
            self._model = YOLO(os.path.join("bengalaFecaf","weights", self.modelo))
        return None
    
    def avaliar(self, image): 
        with ocultar_prints():
            try:
                # Roda o modelo
                results = self._model(image)

                deteccoes = []   # Lista final com objetos detectados

                if results and len(results) > 0:
                    boxes = results[0].boxes
                    names = self._model.names  # dicionário {id: nome}

                    for box in boxes:
                        classe_id = int(box.cls[0])
                        nome_classe = names.get(classe_id, "desconhecido")
                        confianca = float(box.conf[0])
                        x1, y1, x2, y2 = box.xyxy[0].tolist()  # Bounding box

                        deteccoes.append({
                            "classe_id": classe_id,
                            "classe": nome_classe,
                            "confianca": confianca,
                            "bbox": [x1, y1, x2, y2]
                        })

                    # Salva imagem com bounding boxes
                    results[0].save(filename="images/runs_yolo/output.jpg")

                # Limpeza
                del results
                gc.collect()

                return deteccoes

            except Exception as e:
                print(f"Erro ao avaliar a imagem: {e}")
                return []