@echo off

REM Check if the parameter n is provided
if "%1"=="" (
    echo Usage: %0 ^<number_of_slaves^>
    exit /b 1
)

set n=%1

REM Navigate to the config-hadoop/master directory
cd config-hadoop\master\config || (
    echo Directory not found
    exit /b 1
)

REM Clear the old content of the workers file and add new content
echo. > workers
for /L %%i in (1,1,%n%) do (
    echo quochuy026-slave%%i >> workers
)

echo Updated workers file with %n% slaves.

REM Navigate back to the root directory
cd ..\..\..

REM Copy compose.yaml to compose-dynamic.yaml (force)
copy /Y compose.yaml compose-dynamic.yaml
if errorlevel 1 (
    echo Failed to copy compose.yaml. Exiting...
    exit /b 1
)

REM Add slave services to compose-dynamic.yaml
for /L %%i in (1,1,%n%) do (
    echo. >> compose-dynamic.yaml
    echo   hdsphere-slave%%i: >> compose-dynamic.yaml
    echo     image: hdsphere-slave >> compose-dynamic.yaml
    echo     container_name: hdsphere-slave%%i >> compose-dynamic.yaml
    echo     hostname: quochuy026-slave%%i >> compose-dynamic.yaml
    echo     networks: >> compose-dynamic.yaml
    echo       - hadoop-net >> compose-dynamic.yaml
    echo     command: /bin/bash -c "service ssh start; tail -f /dev/null" >> compose-dynamic.yaml
)

echo Updated compose-dynamic.yaml with %n% slave nodes.