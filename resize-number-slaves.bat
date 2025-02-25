@echo off
REM N is the node number of the Hadoop cluster
set N=%1

REM Check if the user has provided the node number
if "%N%"=="" (
    echo Please specify the node number of hadoop cluster!
    exit /b 1
)

REM Change slaves file
set /a i=1
del master\config\workers

:loop
if %i% leq %N% (
    echo minhquang-slave%i% >> master\config\workers
    set /a i=%i% + 1
    goto loop
)
