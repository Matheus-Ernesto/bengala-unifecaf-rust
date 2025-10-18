import cv2
import time
import os

# Importa servidor
from bengalaFecaf.server import Server
# Importa IA Yolo
from bengalaFecaf.yolo import Yolo
# Importa IA Midas
from bengalaFecaf.midas import Midas

# Cria a IA Midas
midas = Midas()
midas.modelo = "midas_v21_small_256.pt"
midas.tipo_modelo = "midas_v21_small_256"
midas.carregar()

# Cria a IA Yolo
yolo = Yolo()
yolo.modelo = "yolov5nu.pt"
yolo.carregar()

# Cria pasta se não existir
os.makedirs("images/notebook", exist_ok=True)

# Abre a câmera padrão
camera = cv2.VideoCapture(0)

try:
    while True:
        # Captura frame
        ret, frame = camera.read()
        if not ret:
            print("❌ Erro ao capturar imagem da câmera")
            break

        # Salva frame em arquivo
        path_img = "images/notebook/output.jpg"
        image_path = f"images/runs_midas/output-midas_v21_small_256.png"
        image = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)  # Lê em tons de cinza
        colored_output = cv2.cvtColor(image, cv2.COLOR_GRAY2BGR)
        # Caminho final
        cv2.imwrite(f"images/runs_midas/output.png", colored_output)
        
        cv2.imwrite(path_img, frame)

        # Avalia nas IAs
        midas.avaliar("images/notebook")
        yolo.avaliar(path_img)

        print("✅ Loop processado")

        # Espera 2 segundos antes de repetir (ajuste se quiser mais rápido/lento)
        time.sleep(2)

except KeyboardInterrupt:
    print("🛑 Loop interrompido pelo usuário.")

finally:
    camera.release()
    cv2.destroyAllWindows()
