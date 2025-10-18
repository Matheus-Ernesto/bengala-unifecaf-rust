@echo off
for /d /r %%i in (__pycache__) do (
    if exist "%%i" rd /s /q "%%i"
)
echo Python limpo!

cd project\server-rust
cargo clean

echo Cargo limpo!