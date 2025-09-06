use fltk::{app, frame::Frame, image::PngImage, prelude::*, window::Window};
use image::{DynamicImage, ImageFormat};
use std::io::Cursor;
use std::path::Path;

fn load_and_resize(path: &str, grayscale: bool) -> Option<PngImage> {
    if !Path::new(path).exists() {
        return None;
    }

    // Carrega imagem com crate "image"
    let mut img = image::open(path).ok()?;

    if grayscale {
        img = DynamicImage::ImageLuma8(img.to_luma8());
    }

    // Redimensiona (400x300)
    let resized = img.resize_exact(400, 300, image::imageops::FilterType::Nearest);

    // Salva para buffer em PNG usando Cursor
    let mut buf = Vec::new();
    let mut cursor = Cursor::new(&mut buf);
    resized.write_to(&mut cursor, ImageFormat::Png).ok()?;

    // Cria PngImage do FLTK
    PngImage::from_data(&buf).ok()
}

fn main() {
    let app = app::App::default();

    let mut wind = Window::new(100, 100, 1300, 400, "Visualização de Imagens");

    let mut frame1 = Frame::new(10, 10, 400, 300, "");
    let mut frame2 = Frame::new(420, 10, 400, 300, "");
    let mut frame3 = Frame::new(830, 10, 400, 300, "");

    wind.end();
    wind.show();

    let paths = [
        "images/photos/output.png",
        "images/runs_yolo/output.jpg",
        "images/runs_midas/output.png",
    ];

    // usa add_timeout normal (não o 3)
    app::add_timeout(0.1, move || {
        if let Some(img) = load_and_resize(paths[0], false) {
            frame1.set_image(Some(img));
        }
        if let Some(img) = load_and_resize(paths[1], false) {
            frame2.set_image(Some(img));
        }
        if let Some(img) = load_and_resize(paths[2], true) {
            frame3.set_image(Some(img));
        }

        // agenda novamente
        app::repeat_timeout(0.1, || {});
    });

    app.run().unwrap();
}
