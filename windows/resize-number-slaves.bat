@echo off
setlocal enabledelayedexpansion

REM Check if the parameter n is provided
if "%1"=="" (
    echo Usage: %0 ^<number_of_slaves^>
    exit /b 1
)

set n=%1

REM Navigate to the config-hadoop/master directory
if not exist "config-hadoop\master\config" (
    echo Directory not found
    exit /b 1
)
cd config-hadoop\master\config

REM Clear the old content of the workers file and add new content
echo. > workers
for /L %%i in (1,1,!n!) do (
    echo minhquang-slave%%i>> workers
)

echo Updated workers file with %n% slaves.

REM Navigate back to the root directory
cd ..\..\..

REM Copy compose.yaml to compose-dynamic.yaml (force)
copy /Y compose.yaml compose-dynamic.yaml
if not exist compose-dynamic.yaml (
    echo Failed to copy compose.yaml. Exiting...
    exit /b 1
)

REM Remove old volumes section from compose-dynamic.yaml using PowerShell script
powershell -Command "(Get-Content 'compose-dynamic.yaml') | Where-Object {$_ -notmatch '^(volumes:|  hdfs_namenode:)'} | Set-Content 'compose-dynamic.yaml'"

REM Add slave services to compose-dynamic.yaml
for /L %%i in (1,1,!n!) do (
    echo   slave%%i:>> compose-dynamic.yaml
    echo     image: hadoop-slave1 >> compose-dynamic.yaml
    echo     container_name: slave%%i >> compose-dynamic.yaml
    echo     hostname: minhquang-slave%%i >> compose-dynamic.yaml
    echo     volumes:>> compose-dynamic.yaml
    echo       - hdfs_datanode%%i:/home/hadoopminhquang/hadoop/hadoop_data/hdfs/datanode>> compose-dynamic.yaml
    echo     networks: >> compose-dynamic.yaml
    echo       - hadoop-net >> compose-dynamic.yaml
    echo     command: /bin/bash -c ^"service ssh start; tail -f /dev/null^" >> compose-dynamic.yaml
)

REM Ensure volumes section is added at the end of the file
(
    echo.
    echo volumes:
    echo   hdfs_namenode:
    for /L %%i in (1,1,!n!) do (
        echo   hdfs_datanode%%i:
    )
) >> compose-dynamic.yaml

echo Updated compose-dynamic.yaml with %n% slave nodes.
