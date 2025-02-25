🚀 HaMu is a tool for quickly deploying a fully containerized pseudo-distributed Hadoop cluster, making Hadoop setup faster and easier.

##📖 **My Story** *(can be ignored)* 

Setting up a Hadoop cluster manually can be frustrating, especially for beginners. My friends and I faced several challenges when deploying a multi-node Hadoop cluster on **VMware**, such as configuration issues, poor scalability, and inefficient resource usage. To solve these problems, I developed **HaMu**, a tool that simplifies Hadoop deployment using Docker containers.  

I first learned about Hadoop in the **Introduction to Big Data** course at my university. The subject itself was not difficult, but it became challenging when my friends and I had to deploy a multi-node Hadoop cluster on **VMware**. While Hadoop is powerful, using VMware introduced several inconveniences, such as:  

- Inability to scroll up to read errors in the terminal  
- Unfriendly communication with external systems  
- Weak performance due to virtualization overhead  
- Difficulty in scaling out  
- High storage usage for backups  
- Long rebuild times when making mistakes  

To address these issues, I decided to containerize the Hadoop system using **Docker**. This project serves as a final summary of my knowledge in both Hadoop and Docker.  

💡 I hope **HaMu** helps you quickly set up a Hadoop multi-node cluster, making it easier and more efficient to practice Hadoop. 🚀  



## 👥 Authors

- [@Quang Nguyen](https://github.com/DOCUTEE)

## Contributors

[![All Contributors](https://img.shields.io/github/all-contributors/DOCUTEE/HaMu?color=ee8449&style=flat-square)](#contributors)
## 

## ✨ Features  

- Deploy a Hadoop multi-node cluster with a single command.  
- Customize the number of slave nodes.  
- [Set the cluster owner's name.](#modify-the-owner-name)
- [Interact with the cluster via CLI or Web UI.](#-interact-with-the-web-ui)

## 🚀 Installation Guide  

Follow these steps to install and run HaMu on your system.  

### **Step 1: Clone the Repository**  
First, download the HaMu repository to your local machine:  
```sh
git clone https://github.com/DOCUTEE/HaMu.git
cd HaMu
```

### **Step 2: Build Docker Images (Optional)**  
Building Docker images is required only for the first time or after making changes in the HaMu directory (such as [modifying the owner name](#modify-the-owner-name)). Make sure Docker is running before proceeding.

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
![Deme](https://github.com/user-attachments/assets/a79645b2-84bd-4f7e-aa7b-7bb5bf9474e5)

If you see live DataNodes, your cluster is running successfully. 🚀

### Modify the Owner Name  
If you need to change the owner name, run the `rename-owner.py` script and enter your new owner name when prompted.  

> **⏳ Note:** If you want to check the current owner name, it is stored in `OwnerName.txt`.  

```sh
python rename-owner.py
```

### 🌐 Interact with the Web UI  

You can access the following web interfaces to monitor and manage your Hadoop cluster:  

- **YARN Resource Manager UI** → [http://localhost:9004](http://localhost:9004)  
  Provides an overview of cluster resource usage, running applications, and job details.  

- **NameNode UI** → [http://localhost:9870](http://localhost:9870)  
  Displays HDFS file system details, block distribution, and overall health status.  





    
