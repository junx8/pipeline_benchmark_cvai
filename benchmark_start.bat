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
    set /p choice="Do you want setup the environment? (y/n)"

    :aicheck_choice
    if /i "%choice%"=="y" (
        echo.
        echo.
        echo Starting setup environment for AI Benchmark...
        call ov_benchmark_env_setup.bat
        goto aiend
    ) else if /i "%choice%"=="n" (
        echo.
        echo.
        echo Select not setup environment for AI Benchmark...
        goto aiend
    ) else (
        echo invalid Input! Please enter 'y' or 'n'.
        set /p choice=
        goto aicheck_choice
    )
    :aiend
    call ov_benchmark_run.bat
    exit /b
) else if errorlevel 1 (
    echo.
    echo.
    echo Start CV Benchmark...
    cd cv_benchmark
    echo If this is the first time you are running it, please set up the environment for CV Benchmark.
    set /p choice="Do you want setup the environment? (y/n)"

    :cvcheck_choice
    if /i "%choice%"=="y" (
        echo.
        echo.
        echo Starting setup environment for CV Benchmark...
        call pipc_benchmark_env_setup.bat
        goto cvend
    ) else if /i "%choice%"=="n" (
        echo.
        echo.
        echo Select not setup environment for CV Benchmark...
        goto cvend
    ) else (
        echo invalid Input! Please enter 'y' or 'n'.
        set /p choice=
        goto cvcheck_choice
    )
    :cvend
    call pipc_benchmark_run.bat
    exit /b
)