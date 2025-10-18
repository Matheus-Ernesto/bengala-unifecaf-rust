use eframe::egui;
use std::fs;
use std::io::Read;
use std::path::PathBuf;
use std::time::{Duration, SystemTime};
use std::collections::HashMap;

const TARGET_SIZE: (u32, u32) = (400, 300);
const POLL_MS: u64 = 250;

struct ImageUpdater {
    paths: Vec<(String, PathBuf)>,
    images: HashMap<String, Option<egui::TextureHandle>>,
    mtimes: HashMap<String, Option<SystemTime>>,
    last_update: std::time::Instant,
}

impl ImageUpdater {
    fn new(_cc: &eframe::CreationContext<'_>) -> Self {
        let base_dir = std::env::current_dir().unwrap();

        let rel_paths = vec![
            ("Notebook".to_string(), "images/photos/output.jpg"),
            ("YOLO".to_string(), "images/runs_yolo/output.jpg"),
            ("MiDaS".to_string(), "images/runs_midas/output.png"),
        ];

        let paths: Vec<(String, PathBuf)> = rel_paths
            .into_iter()
            .map(|(name, rel)| (name, base_dir.join(rel)))
            .collect();

        Self {
            paths,
            images: HashMap::new(),
            mtimes: HashMap::new(),
            last_update: std::time::Instant::now(),
        }
    }

    fn try_load_image(
        &self,
        ctx: &egui::Context,
        path: &PathBuf,
        grayscale: bool,
    ) -> Option<egui::TextureHandle> {
        let mut file = fs::File::open(path).ok()?;
        let mut buf = Vec::new();
        file.read_to_end(&mut buf).ok()?;

        let img = image::load_from_memory(&buf).ok()?;
        let mut img = if grayscale {
            img.grayscale()
        } else {
            img
        };

        img = img.resize(TARGET_SIZE.0, TARGET_SIZE.1, image::imageops::FilterType::Lanczos3);

        let size = [img.width() as usize, img.height() as usize];
        let rgba = img.to_rgba8();

        Some(ctx.load_texture(
            path.to_string_lossy(),
            egui::ColorImage::from_rgba_unmultiplied(size, rgba.as_flat_samples().as_slice()),
            egui::TextureOptions::default(),
        ))
    }

    fn update_images(&mut self, ctx: &egui::Context) {
        if self.last_update.elapsed() < Duration::from_millis(POLL_MS) {
            return;
        }
        self.last_update = std::time::Instant::now();

        for (name, path) in &self.paths {
            let mtime = fs::metadata(path)
                .and_then(|m| m.modified())
                .ok();

            let last_mtime = self.mtimes.get(name).cloned().unwrap_or(None);

            if mtime != last_mtime {
                let texture = self.try_load_image(ctx, path, name == "MiDaS");
                self.images.insert(name.clone(), texture);
                self.mtimes.insert(name.clone(), mtime);
            }
        }
    }
}

impl eframe::App for ImageUpdater {
    fn update(&mut self, ctx: &egui::Context, _frame: &mut eframe::Frame) {
        self.update_images(ctx);

        egui::CentralPanel::default().show(ctx, |ui| {
            ui.horizontal(|ui| {
                for (name, _) in &self.paths {
                    ui.vertical(|ui| {
                        ui.label(egui::RichText::new(name).strong().size(16.0));

                        if let Some(Some(tex)) = self.images.get(name) {
                            ui.image(tex); // ✅ corrigido
                        } else {
                            ui.label("(sem arquivo/erro)");
                        }
                    });
                }
            });

            if ui.button("Sair").clicked() {
                std::process::exit(0);
            }
        });
    }
}

fn main() -> eframe::Result<()> {
    let native_options = eframe::NativeOptions::default();
    eframe::run_native(
        "Visualizador de Imagens - Notebook / YOLO / MiDaS",
        native_options,
        Box::new(|cc| Ok(Box::new(ImageUpdater::new(cc)))), // ✅ corrigido
    )
}