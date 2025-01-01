@echo off
set LOGFILE=C:\Scripts\palworld_log.txt

echo ----------------------- [%date%] --------------------- >> %LOGFILE%

:: Log the start of the process
echo [%date% %time%] - Stopping PalWorld server... >> %LOGFILE%

:: Force kill processes by full path using PowerShell
echo [%date% %time%] - Searching for PalWorld server process... >> %LOGFILE%
powershell -Command "Get-Process | Where-Object {$_.Path -eq 'C:\steamcmd\steamapps\common\PalServer\Pal\Binaries\Win64\PalServer-Win64-Shipping-Cmd.exe'} | Stop-Process -Force" >> %LOGFILE% 2>&1

:: Pause briefly to ensure processes have been terminated
timeout /t 5 /nobreak >nul

:: Double-check if processes are still running using PowerShell
echo [%date% %time%] - Verifying PalWorld server is stopped... >> %LOGFILE%
powershell -Command "if (Get-Process | Where-Object {$_.Path -eq 'C:\steamcmd\steamapps\common\PalServer\Pal\Binaries\Win64\PalServer-Win64-Shipping-Cmd.exe'}) { exit 1 }" 
if %errorlevel% neq 0 (
    echo [%date% %time%] - ERROR: PalServer-Win64-Shipping-Cmd.exe is still running! >> %LOGFILE%
    exit /b 1
)

:: Proceed if process is confirmed stopped
echo [%date% %time%] - PalWorld server stopped successfully. >> %LOGFILE%

:: Check for updates
echo [%date% %time%] - Checking for PalWorld Server updates... >> %LOGFILE%
C:\steamcmd\steamcmd.exe +login anonymous +app_update 2394010 validate +quit >> %LOGFILE% 2>&1

if %errorlevel% neq 0 (
    echo [%date% %time%] - Update failed with error code %errorlevel%. >> %LOGFILE%
    exit /b %errorlevel%
)

:: Launch the server
echo [%date% %time%] - Launching PalWorld server... >> %LOGFILE%
cd C:\steamcmd\steamapps\common\PalServer
start "" /B PalServer.exe -ServerName="TeagueWorld" -port=8211 -players=4 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
echo [%date% %time%] - Server started successfully. >> %LOGFILE%
