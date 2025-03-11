@echo off
setlocal enabledelayedexpansion

REM The default node number is 3
set N=3
if not "%1"=="" set N=%1

REM Calculate N-1 and store in Nminus1
set /A Nminus1=N-1

echo Resizing cluster to %Nminus1% slave nodes...
call windows/resize-number-slaves.bat %Nminus1%
if errorlevel 1 (
    echo Failed to resize slaves. Exiting...
    exit /b 1
)

echo Starting Docker Compose services...
docker compose -f compose-dynamic.yaml up -d
if errorlevel 1 (
    echo Failed to start Docker Compose services. Exiting...
    exit /b 1
)

REM Wait for all containers to be in 'running' state
echo Waiting for all containers to be in 'running' state...
:wait_for_containers
for /f "tokens=*" %%i in ('docker compose ps --format "{{.State}}" ^| findstr /v "running"') do (
    set STATUS=%%i
)
if defined STATUS (
    echo Some containers are still starting. Waiting...
    timeout /t 5 >nul
    goto wait_for_containers
)
echo All containers are running!

echo Copying workers file to master container...
docker cp config-hadoop\master\config\workers master:/home/hadoopminhquang/hadoop/etc/hadoop/workers
if errorlevel 1 (
    echo Failed to copy workers file. Exiting...
    exit /b 1
)

echo Converting workers file to Unix format...
docker exec master dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/workers
if errorlevel 1 (
    echo Failed to convert workers file. Exiting...
    exit /b 1
)

echo Restarting the cluster...
docker exec -it master /bin/bash -c "su - hadoopminhquang"
if errorlevel 1 (
    echo Failed to restart the cluster. Exiting...
    exit /b 1
)

echo Cluster setup completed successfully!