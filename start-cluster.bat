@echo off

REM The default node number is 3
set N=%1
if "%N%"=="" set N=3

REM Tính giá trị N-1 và lưu vào biến Nminus1
set /a Nminus1=%N%-1

REM Call the resize-number-slaves.bat with the number of slaves as an argument
call resize-number-slaves.bat %Nminus1%

REM Create hadoop network
docker network create --driver=bridge hadoop-network >nul 2>&1

REM Start Hadoop master container
echo start minhquang-master container...
docker rm -f minhquang-master >nul 2>&1
docker run -itd ^
    --net=hadoop-network ^
    --name minhquang-master ^
    --hostname minhquang-master ^
    docutee/hadoop-master >nul 2>&1

REM copy workers file to master container
docker cp master\config\workers minhquang-master:/home/hadoopminhquang/hadoop/etc/hadoop/workers

REM convert workers from dos to unix
docker exec minhquang-master dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/workers

REM Start Hadoop slave containers
set /a i=1
:loop
if %i% leq %N% (
    echo start minhquang-slave%i% container...
    docker rm -f minhquang-slave%i% >nul 2>&1
    docker run -itd ^
        --net=hadoop-network ^
        --name minhquang-slave%i% ^
        --hostname minhquang-slave%i% ^
        docutee/hadoop-slave >nul 2>&1
    set /a i=%i% + 1
    goto loop
)


REM Get into the Hadoop master container
docker start -i minhquang-master
