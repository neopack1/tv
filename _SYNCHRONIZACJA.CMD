@echo off
SETLOCAL enableextensions 
SETLOCAL enabledelayedexpansion
chcp 65001 >NUL 2>&1
pushd "%~dp0"


:CZAS_DATA
for /f "tokens=1-4 delims=/-. " %%i in ('date /t') do (call :set_date %%i %%j %%k %%l)
goto :end_set_date
:set_date
if "%1:~0,1%" gtr "9" shift
for /f "skip=1 tokens=2-4 delims=(-)" %%m in ('echo,^|date') do (set %%m=%1&set %%n=%2&set %%o=%3)
goto :eof
:end_set_date
set DD=%dd%
set MM=%mm%
set YYYY=%yy%
set MojaData=%YYYY%-%MM%-%DD%
:set_time
set _TIME=%TIME:~0,-3%
set _S=%_TIME:~6%
FOR /F "tokens=1* delims=:" %%a IN ('time /t') DO set MojCzas=%%a:%%b:%_S%
:end_set_time



set KATALOG=logo
set PLIK=.lista.lst



:PROGRAM
cls
ECHO.
echo [41;93m                   LISTOWANIE IKON KANAŁÓW                   [0m
set LISTA=%KATALOG%\%PLIK%
if exist %LISTA% del /f /q %LISTA%
set "DT=%MojaData% %MojCzas%"
echo %DT%>%LISTA%
FOR /F "tokens=*" %%G IN ('dir /A:-D /b "%KATALOG%\*.*"') DO (
	echo %%G>>%LISTA%
	set /a count+=1
)
echo # %count% plik(ów) zapisanych na liście (%DT%)
echo.





echo [41;93m                   SYNCHRONIZACJA Z GITHUB                   [0m
echo.

git add --all
git commit -a -m 'update'
git push -u origin master

echo.
echo [30;102m                   ZAKOŃCZONO SYNCHRONIZACJĘ                   [0m
echo. & echo.
echo             [7m NACINIJ KLAWISZ ABY ZAMKNĄC OKNO [0m
timeout /T 10 >nul
exit /b
