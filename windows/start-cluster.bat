@echo off
setlocal enabledelayedexpansion

REM The default node number is 3
set N=3
if not "%1"=="" set N=%1

REM Calculate N-1 and store in Nminus1
set /A Nminus1=N-1

echo Resizing cluster to %Nminus1% slave nodes...
call windows\resize-number-slaves.bat %Nminus1%
if errorlevel 1 (
    echo Failed to resize slaves. Exiting...
    exit /b 1
)

docker build -t master-official:latest ./config-hadoop


echo Starting Docker Compose services...
docker compose -f compose-dynamic.yaml up -d
if errorlevel 1 (
    echo Failed to start Docker Compose services. Exiting...
    exit /b 1
)

@REM REM Wait for all containers to be in 'running' state
@REM echo Waiting for all containers to be in 'running' state...
@REM :wait_for_containers
@REM set STATUS=
@REM for /f "tokens=*" %%i in ('docker compose ps --format "{{.State}}"') do (
@REM     if not "%%i"=="running" set STATUS=1
@REM )
@REM if defined STATUS (
@REM     echo Some containers are still starting. Waiting...
@REM     timeout /t 5 >nul
@REM     goto wait_for_containers
@REM )
echo All containers are running!

@REM echo Copying workers file to master container...
@REM docker cp config-hadoop\master\config\workers master:/home/hadoopminhquang/hadoop/etc/hadoop/workers
@REM if errorlevel 1 (
@REM     echo Failed to copy workers file. Exiting...
@REM     exit /b 1
@REM )

@REM echo Converting workers file to Unix format...
@REM docker exec master dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/workers
@REM if errorlevel 1 (
@REM     echo Failed to convert workers file. Exiting...
@REM     exit /b 1
@REM )

echo Restarting the cluster...
docker exec -it master bash -c "su - hadoopminhquang"
if errorlevel 1 (
    echo Failed to restart the cluster. Exiting...
    exit /b 1
)

echo Cluster setup completed successfully!
