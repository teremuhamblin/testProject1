@echo off
title testProject1 - Launcher Windows 10
color 0B

:: --- Verifie Admin et relance en Admin si besoin ---
net session >nul 2>&1
if %errorLevel% NEQ 0 (
    echo Demande des droits Administrateur...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit
)

cd /d "%~dp0"
echo ==========================================
echo   testProject1 v2.0 - Windows 10
echo   150 fonctions - Inspire de Sophia Script
echo ==========================================
echo.
echo [1] Lancer le Wrapper GUI - 150 cases a cocher (Recommande)
echo [2] Lancer le Script complet - Applique tout d'un coup
echo [3] Lancer le Script en mode TEST - Sans rien appliquer, juste verifier
echo [4] Quitter
echo.
set /p choix="Ton choix (1-4) : "

if "%choix%"=="1" powershell -ExecutionPolicy Bypass -File "%~dp0testProject1_Wrapper_Complet.ps1"
if "%choix%"=="2" powershell -ExecutionPolicy Bypass -File "%~dp0testProject1.ps1"
if "%choix%"=="3" powershell -ExecutionPolicy Bypass -File "%~dp0testProject1_Launcher.ps1" -TestOnly
if "%choix%"=="4" exit

echo.
echo Termine ! Appuie sur une touche...
pause >nul
