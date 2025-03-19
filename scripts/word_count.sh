#!/bin/bash

USERNAME=$(whoami)

echo "Creating HDFS directories..."
hdfs dfs -mkdir -p /user/$USERNAME
hdfs dfs -mkdir -p /user/$USERNAME/input

echo "Copying input files to HDFS..."
hdfs dfs -put $HADOOP_HOME/etc/hadoop/*.xml /user/$USERNAME/input/

$HADOOP_HOME/bin/hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.4.1.jar grep /user/$USERNAME/input /user/$USERNAME/output 'hadoop[a-z.]+'

echo "Displaying output:"
$HADOOP_HOME/bin/hdfs dfs -cat /user/$USERNAME/output/*

echo "MapReduce job completed!"

