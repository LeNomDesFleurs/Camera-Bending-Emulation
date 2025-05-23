@echo off
setlocal

:: Get the first argument as a command (default is "all")
set CMD=%1
if "%CMD%"=="" set CMD=all

:: ==== INIT ====
if "%CMD%"=="init" (
    echo [INIT] Updating submodules...
    git submodule update --init --recursive
    goto :eof
)

:: ==== CLEAN ====
if "%CMD%"=="clean" (
    echo [CLEAN] Removing build directory...
    if exist build (
        rmdir /s /q build
    ) else (
        echo No build directory found.
    )
    goto :eof
)

:: ==== UPDATE ====
if "%CMD%"=="update" (
    echo [UPDATE] Pulling latest commits from submodules...
    git submodule update --remote --merge
    goto :eof
)

:: ==== BUILD ====
if "%CMD%"=="build" (
    echo [BUILD] Building project...
    if not exist build mkdir build
    cd build
    cmake .. || exit /b
    cmake --build . || exit /b
    cd ..
    goto :eof
)

:: ==== REBUILD ====
if "%CMD%"=="re" (
    call "%~f0" clean
    call "%~f0" all
    goto :eof
)

:: ==== DEFAULT: ALL ====
if "%CMD%"=="all" (
    call "%~f0" init
    call "%~f0" build
    goto :eof
)

:: ==== Unknown Command ====
echo Unknown command: %CMD%
echo.
echo Usage:
echo   build.bat [init|build|re|clean|update|all]
exit /b 1
