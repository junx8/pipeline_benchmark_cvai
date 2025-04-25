@echo off
echo Please Select benchmark for CV/AI:
echo 1. CV
echo 2. AI
echo 3. Quit

choice /C:123 /N /T:30 /D:3 /M "Please Entry the Number:"

if errorlevel 3 (
    echo.
    echo.
    echo Quit...
    exit /b
) else if errorlevel 2 (
    echo.
    echo.
    echo Start AI Benchmark...
    cd ov_benchmark
    echo If this is the first time you are running it, please set up the environment for AI Benchmark.
    choice /C YN /M "Do you want setup the environment?"

    if errorlevel 2 (
        echo.
        echo.
        echo Select not setup environment for AI Benchmark...
    ) else if errorlevel 1 (
        echo.
        echo.
        echo Starting setup environment for AI Benchmark...
        call ov_benchmark_env_setup.bat
    )
    call ov_benchmark_run.bat
    exit /b

) else if errorlevel 1 (
    echo.
    echo.
    echo Start CV Benchmark...
    cd cv_benchmark
    echo If this is the first time you are running it, please set up the environment for CV Benchmark.
    choice /C YN /M "Do you want setup the environment?"

    if errorlevel 2 (
        echo.
        echo.
        echo Select not setup environment for CV Benchmark...
    ) else if errorlevel 1 (
        echo.
        echo.
        echo Starting setup environment for CV Benchmark...
        call pipc_benchmark_env_setup.bat
    )
    call pipc_benchmark_run.bat
    exit /b
)