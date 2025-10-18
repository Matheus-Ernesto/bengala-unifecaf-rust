import tkinter as tk
from PIL import Image, ImageTk, ImageOps
import os
import io

# Caminhos das imagens (relativos ao arquivo atual)
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
REL_PATHS = [
    "images/notebook/output.jpg",
    "images/runs_yolo/output.jpg",
    "images/runs_midas/output.png",
]
PATHS = [os.path.join(BASE_DIR, p) for p in REL_PATHS]

TARGET_SIZE = (400, 300)  # largura x altura
POLL_MS = 250             # intervalo de atualização (ms)

class ImageUpdater:
    def __init__(self, root: tk.Tk):
        self.root = root
        self.root.title("Visualizador de Imagens - Notebook / YOLO / MiDaS")

        # 3 labels lado a lado
        self.frame = tk.Frame(root)
        self.frame.pack(padx=10, pady=10)

        self.labels = []
        titles = ["Notebook", "YOLO", "MiDaS"]
        for i, title in enumerate(titles):
            col = tk.Frame(self.frame)
            col.grid(row=0, column=i, padx=10)

            tk.Label(col, text=title, font=("Arial", 12, "bold")).pack(pady=(0, 6))
            lbl = tk.Label(col, text="(aguardando imagem...)", width=320, height=240, bd=1, relief=tk.SOLID)
            lbl.pack()
            self.labels.append(lbl)

        # cache de mtime p/ recarregar apenas se mudou
        self._mtimes = [None, None, None]

        # botão sair
        btn = tk.Button(root, text="Sair", command=self.quit)
        btn.pack(pady=8)

        self.update_images()

    def _safe_read(self, path: str) -> bytes | None:
        """Lê o arquivo sem travar se estiver sendo escrito."""
        try:
            # abre em modo binário e tenta ler tudo
            with open(path, "rb") as f:
                return f.read()
        except Exception:
            return None

    def load_image_safely(self, path: str, grayscale: bool = False) -> ImageTk.PhotoImage | None:
        data = self._safe_read(path)
        if data is None:
            return None
        try:
            img = Image.open(io.BytesIO(data)).convert("RGB")
            if grayscale:
                img = ImageOps.grayscale(img).convert("RGB")
            img.thumbnail(TARGET_SIZE)  # mantém proporção
            return ImageTk.PhotoImage(img)
        except Exception:
            return None

    def update_images(self):
        for i, path in enumerate(PATHS):
            try:
                mtime = os.path.getmtime(path) if os.path.exists(path) else None
            except Exception:
                mtime = None

            if mtime is None:
                # arquivo não existe
                self.labels[i].config(text="(sem arquivo)", image="")
                self.labels[i].image = None
                self._mtimes[i] = None
                continue

            # só recarrega se alterou
            if self._mtimes[i] == mtime:
                continue

            tk_img = self.load_image_safely(path, grayscale=(i == 2))
            if tk_img:
                self.labels[i].config(image=tk_img, text="")
                self.labels[i].image = tk_img  # segura referência
                self._mtimes[i] = mtime
            else:
                self.labels[i].config(text="(erro ao carregar)", image="")
                self.labels[i].image = None

        self.root.after(POLL_MS, self.update_images)

    def quit(self):
        self.root.destroy()

if __name__ == "__main__":
    root = tk.Tk()
    app = ImageUpdater(root)
    root.mainloop()
