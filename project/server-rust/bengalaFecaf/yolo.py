import os
from ultralytics import YOLO
import torch
import sys
import gc
import cv2   # <--- ADICIONADO

# Configura o nível de log da biblioteca ultralytics para não exibir mensagens
import logging
logging.getLogger("ultralytics").setLevel(logging.CRITICAL)

from contextlib import contextmanager

# Função para ocultar prints
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

# Classe YOLO com funções de treino, carregamento e avaliação
class Yolo:
    def __init__(self):
        self.modelo = "yolov5nu.pt"
        self._model = None

    # Método para treinar o modelo
    def treinar(self, yaml, qualidade, fatoracao):
        self._model = YOLO(os.path.join("bengalaFecaf","weights",self.modelo))

        device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        print(f"Usando dispositivo: {device}")

        train_results = self._model.train(
            data=yaml,
            epochs=fatoracao,
            imgsz=qualidade,
            device=device,
            project="bengalaFecaf/training",
            name="train"
        )

        metrics = self._model.val()

        return None
    
    # Carrega o modelo treinado
    def carregar(self):
        with ocultar_prints():
            self._model = YOLO(os.path.join("bengalaFecaf","weights", self.modelo))
        return None
    
    # Avalia uma imagem e retorna detecções
    def avaliar(self, image): 
        with ocultar_prints():
            try:
                # Roda o modelo
                
                results = self._model(image)

                deteccoes = []

                if results and len(results) > 0:
                    boxes = results[0].boxes
                    names = self._model.names  

                    for box in boxes:
                        classe_id = int(box.cls[0])
                        nome_classe = names.get(classe_id, "desconhecido")
                        confianca = float(box.conf[0])
                        x1, y1, x2, y2 = box.xyxy[0].tolist()

                        deteccoes.append({
                            "classe_id": classe_id,
                            "classe": nome_classe,
                            "confianca": confianca,
                            "bbox": [x1, y1, x2, y2]
                        })

                    # ----------- SALVAR IMAGEM COM CORREÇÃO DE ESPELHAMENTO -----------
                    img_plot = results[0].plot()     # Gera imagem com bounding boxes
                    # img_flip = cv2.flip(img_plot, 0) # Flip horizontal
                    cv2.imwrite("images/runs_yolo/output.jpg", img_plot)
                    # ------------------------------------------------------------------

                # Limpeza
                del results
                gc.collect()

                return deteccoes

            except Exception as e:
                print(f"Erro ao avaliar a imagem: {e}")
                return []
