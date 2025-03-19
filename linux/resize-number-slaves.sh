#!/bin/bash

set -e  

# Check if the parameter n is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <number_of_slaves>"
    exit 1
fi

n=$1

# Navigate to the config-hadoop/master directory
cd config-hadoop/master/config || { echo "Directory not found"; exit 1; }

# Clear the old content of the workers file and add new content
> workers
for ((i=1; i<=n; i++)); do
    echo "minhquang-slave$i" >> workers
done

echo "Updated workers file with $n slaves."

# Navigate back to the root directory
cd ../../..

# Copy compose.yaml to compose-dynamic.yaml (force)
cp compose.yaml compose-dynamic.yaml
if [ $? -ne 0 ]; then
    echo "Failed to copy compose.yaml. Exiting..."
    exit 1
fi

# Remove old volumes section from compose-dynamic.yaml
sed -i '/^volumes:/,$d' compose-dynamic.yaml

# Add slave services to compose-dynamic.yaml
for ((i=1; i<=n; i++)); do
    cat <<EOL >> compose-dynamic.yaml
  slave$i:
    image: hadoop-slave1
    container_name: slave$i
    hostname: minhquang-slave$i
    volumes:
      - hdfs_datanode$i:/home/hadoopminhquang/hadoop/hadoop_data/hdfs/datanode
    
    networks:
      - hadoop-net
    command: /bin/bash -c "service ssh start; tail -f /dev/null"

EOL
done

# Ensure volumes section is at the end and not duplicated
cat <<EOL >> compose-dynamic.yaml

volumes:
  hdfs_namenode:

EOL

for ((i=1; i<=n; i++)); do
    echo "  hdfs_datanode$i:" >> compose-dynamic.yaml
done

echo "Updated compose-dynamic.yaml with $n slave nodes."
