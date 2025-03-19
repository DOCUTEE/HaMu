#!/bin/bash

echo "Starting HDFS..."
start-dfs.sh

echo "Starting YARN..."
start-yarn.sh

echo "Hadoop services started successfully!"

#check connection
hdfs dfsadmin -report
yarn node -list