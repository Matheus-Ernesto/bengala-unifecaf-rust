use fltk::{app, prelude::*, window::Window, frame::Frame, image::PngImage};
use std::path::Path;

fn main() {
    let app = app::App::default();
    let mut wind = Window::new(100, 100, 500, 400, "Visualização de Imagens");

    let mut frame = Frame::new(0, 0, 500, 400, "");
    let img = PngImage::load(Path::new("../../images/photos/output.png")).unwrap();
    frame.set_image(Some(img));

    wind.end();
    wind.show();

    app.run().unwrap();
}
