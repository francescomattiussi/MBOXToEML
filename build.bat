@echo off
REM This batch file builds the mbox_to_eml_gui.py script into an executable using PyInstaller.

REM Check if virtual environment exists
IF NOT EXIST ".venv\Scripts\pip.exe" (
    echo Virtual environment not found. Please run 'python -m venv .venv' and 'pip install pyinstaller'.
    exit /b 1
)

REM Check if PyInstaller is installed in venv
.venv\Scripts\pip.exe show pyinstaller >nul 2>nul
IF ERRORLEVEL 1 (
    echo PyInstaller is not installed in virtual environment. Please run '.venv\Scripts\activate' then 'pip install pyinstaller'.
    exit /b 1
)

REM Build the executable
.venv\Scripts\pyinstaller.exe --onefile --windowed src\mbox_to_eml_gui.py

REM Check if the build was successful
IF ERRORLEVEL 1 (
    echo Build failed. Please check the output for errors.
    exit /b 1
)

echo Build completed successfully. The executable can be found in the 'dist' directory.