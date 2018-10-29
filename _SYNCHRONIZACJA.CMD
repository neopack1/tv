@echo off
SETLOCAL enableextensions 
SETLOCAL enabledelayedexpansion
chcp 65001 >NUL 2>&1
pushd "%~dp0"
:PROGRAM
cls
ECHO.
echo ECHO [41;93m LISTOWANIE IKON KANAŁÓW [0m
ECHO.
set KATALOG=logo
set PLIK=_lista_.lst
set LISTA=%KATALOG%\%PLIK%
if exist %LISTA% del /f /q %LISTA%
FOR /F "tokens=*" %%G IN ('dir /A:-D /b "%KATALOG%\*.*"') DO (
	echo %%G>>%LISTA%

)



echo ECHO [41;93m SYNCHRONIZACJA Z GITHUB [0m


_sync.sh
timeout /t 3 >nul