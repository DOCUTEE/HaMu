#!/bin/bash

set -e  # Dừng script nếu có lỗi

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
    echo "quochuy026-slave$i" >> workers
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

# Add slave services to compose-dynamic.yaml
for ((i=1; i<=n; i++)); do
    cat <<EOL >> compose-dynamic.yaml
  hdsphere-slave$i:
    image: hdsphere-slave
    container_name: hdsphere-slave$i
    hostname: quochuy026-slave$i
    networks:
      - hadoop-net
    command: /bin/bash -c "service ssh start; tail -f /dev/null"

EOL
done

echo "Updated compose-dynamic.yaml with $n slave nodes."
