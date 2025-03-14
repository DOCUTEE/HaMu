#!/bin/bash

set -e  # Dừng script nếu có lỗi

# The default node number is 3
N=${1:-3}

# Calculate N-1 and store in Nminus1
Nminus1=$((N-1))

echo "Resizing cluster to $Nminus1 slave nodes..."
./linux/resize-number-slaves.sh $Nminus1
if [ $? -ne 0 ]; then
    echo "Failed to resize slaves. Exiting..."
    exit 1
fi

echo "Starting Docker Compose services..."
docker compose -f compose-dynamic.yaml up -d
if [ $? -ne 0 ]; then
    echo "Failed to start Docker Compose services. Exiting..."
    exit 1
fi

# **Chờ tất cả container khởi động hoàn tất**
echo "Waiting for all containers to be in 'running' state..."
while true; do
    STATUS=$(docker compose ps --format '{{.State}}' | grep -v "running" || true)
    if [ -z "$STATUS" ]; then
        echo "All containers are running!"
        break
    fi
    echo "Some containers are still starting. Waiting..."
    sleep 5
done

echo "Copying workers file to master container..."
docker cp config-hadoop/master/config/workers hdsphere-master:/home/hadoopquochuy026/hadoop/etc/hadoop/workers
if [ $? -ne 0 ]; then
    echo "Failed to copy workers file. Exiting..."
    exit 1
fi

echo "Converting workers file to Unix format..."
docker exec -it hdsphere-master dos2unix /home/hadoopquochuy026/hadoop/etc/hadoop/workers
if [ $? -ne 0 ]; then
    echo "Failed to convert workers file. Exiting..."
    exit 1
fi

echo "Restarting the cluster..."
docker exec -it hdsphere-master /bin/bash -c "su - hadoopquochuy026"
if [ $? -ne 0 ]; then
    echo "Failed to restart the cluster. Exiting..."
    exit 1
fi

echo "Cluster setup completed successfully!"
