@echo off
echo Checking for PalWorld Server updates...
C:\steamcmd\steamcmd.exe +login anonymous +app_update 2394010 validate +quit
echo Launching PalWorld server
cd C:\steamcmd\steamapps\common\PalServer
PalServer.exe -ServerName="TeagueWorld" -port=8211 -players=4 -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
