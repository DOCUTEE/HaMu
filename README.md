# 🚀 Hadoop Cluster Setup with Spark, Hive, and Pig  

## 1️⃣ Start Docker 🐳  
- Open **Docker Desktop** (if not already running).  

## 2️⃣ Rename User 🔄  
- Open **WSL2**.  
- Navigate to the project folder:  
  ```bash
  cd HaMu
  ```
- Run the rename script:  
  ```bash
  python rename-owner.py
  ```
- Enter your new username (e.g., `hadoophuydeptrai`).  

## 3️⃣ Build Docker Images 🏷️  
- Move to the Hadoop config directory:  
  ```bash
  cd HaMu/config-hadoop
  ```
- Build the images:  
  ```bash
  docker compose build
  ```
  ![alt text](image-1.png)

## 4️⃣ Start Containers 🚀  
- Return to the main directory:  
  ```bash
  cd ..
  ```
- Start all containers:  
  ```bash
  docker compose up -d
  ```
  ![alt text](image.png)
  ![alt text](image-3.png)

## 5️⃣ Access the Master Container ⛓️  
  ```bash
  docker exec -it master /bin/bash
  ```
  ![alt text](image-2.png)
## 6️⃣ Activate Hive 🐝  
  ```bash
  schematool -initSchema -dbType derby
  ```
  ![alt text](image-6.png)

![alt text](image-5.png)
![alt text](image-7.png)
![alt text](image-8.png)
![alt text](image-9.png)
![alt text](image-4.png)
💪 Now you can use your Hadoop Cluster with Spark, Hive, and Pig! 🎉  

🔹 **Thank you for using this setup!** 😃

