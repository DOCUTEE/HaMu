
# HaMu

🚀 HaMu is a tool for quickly deploying a fully containerized pseudo-distributed Hadoop cluster, making Hadoop setup faster and easier.

## **My Story**  

Setting up a Hadoop cluster manually can be frustrating, especially for beginners. My friends and I faced several challenges when deploying a multi-node Hadoop cluster on **VMware**, such as configuration issues, poor scalability, and inefficient resource usage. To solve these problems, I developed **HaMu**, a tool that simplifies Hadoop deployment using Docker containers.  

I first learned about Hadoop in the **Introduction to Big Data** course at my university. The subject itself was not difficult, but it became challenging when my friends and I had to deploy a multi-node Hadoop cluster on **VMware**. While Hadoop is powerful, using VMware introduced several inconveniences, such as:  

- Inability to scroll up to read errors in the terminal  
- Unfriendly communication with external systems  
- Weak performance due to virtualization overhead  
- Difficulty in scaling out  
- High storage usage for backups  
- Long rebuild times when making mistakes  

To address these issues, I decided to containerize the Hadoop system using **Docker**. This project serves as a final summary of my knowledge in both Hadoop and Docker.  

I hope **HaMu** helps you quickly set up a Hadoop multi-node cluster, making it easier and more efficient to practice Hadoop. 🚀  



## Authors

- [@DOCUTEE](https://github.com/DOCUTEE)

## 

## Features  

- Deploy a Hadoop multi-node cluster with a single command.  
- Customize the number of slave nodes.  
- Set the cluster owner's name.  
- Interact with the cluster via CLI or Web UI.  

## 🚀 Installation Guide  

Follow these steps to install and run HaMu on your system.  

### **Step 1: Clone the Repository**  
First, download the HaMu repository to your local machine:  
```sh
git clone https://github.com/DOCUTEE/HaMu.git
cd HaMu
```

### **Step 2: Build Docker Images (Optional)**  
Building Docker images is required only for the first time or after making changes in the HaMu directory (such as modifying the owner name).
> **⏳ Note:** The first build may take a few minutes as no cached layers exist.
```sh
.\build-image.bat
```

### **Step 3: Enjoy your Hadoop Cluster**  
By default, running the command below will launch a Hadoop cluster with 3 nodes (1 master and 2 slaves):
```sh
.\start-cluster
```
If you want to customize the number of slave nodes, specify the total number of nodes (master + slaves) as an argument.
For example, to start a cluster with 1 master and 5 slaves (6 nodes total):
```sh
.\start-cluster 6
```
### **Step 4: Verify the Installation**  
After step 3, you will see CLI of master container to interact with it.Start cluster by start-dfs.sh and check livenodes by hdfs dfsadmin -report

### **Step 4: Verify the Installation**  

After **Step 3**, you will be inside the **master container's CLI**, where you can interact with the cluster.  

1️⃣ **Start the HDFS services:**  
```sh
start-dfs.sh
```
2️⃣ **Check active DataNodes:**
```sh
hdfs dfsadmin -report
```
📌 Expected Output:

If you see live DataNodes, your cluster is running successfully. 🚀


    
