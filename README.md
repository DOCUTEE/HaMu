 
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
# 🚀 HadoopSphere
A fully containerized **Hadoop, Spark, Hive, and Pig** environment for quick and efficient Big Data processing. 

## 🐜 Table of Contents  
- 📚 [My Story](#-my-story-feel-free-to-skip)  
- 👥 [Authors](#-authors)  
- ✨ [Features](#-features)  
- 🔧 [Tech Stack](#-tech-stack)  
- 💻 [OS Support](#-os-support)  
- 📌 [Prerequisites](#-prerequisites)  
- 🚀 [Installation Guide](#-installation-guide)  
- 🔄 [Modify the Owner Name](#-modify-the-owner-name)  
- 🌐 [Interact with the Web UI](#-interact-with-the-web-ui)  
- ✨ [Contributors](#-contributors-)  
- 📞 [Contact](#-contact)  

---

## 📚 **My Story** *(feel free to skip)*  

Setting up a **Hadoop cluster** manually is frustrating, especially when integrating **Spark, Hive, and Pig**. My friend and I initially developed **HaMu** for a simple Hadoop deployment using Docker, and I extended it further by adding **Spark, Hive, and Pig** for full Big Data analytics support.  

💡 I hope **HadoopSphere** helps you quickly set up a Big Data environment for learning and development! 🚀  

---

## 👥 **Authors**  
- [@Quang Nguyen](https://github.com/DOCUTEE) *(Original Author)*  
- [@Quoc Huy Nguyen](https://github.com/huy-dataguy) *(Extended with Spark, Hive, Pig)*  

---

## ✨ **Features**  
👉 Deploy a **multi-node** Hadoop-Spark-Hive-Pig cluster **with a single command**.  
👉 Customize the number of slave nodes.  
👉 Run **HDFS, YARN, Spark, Hive, and Pig** seamlessly inside Docker.  
👉 Access Web UIs for monitoring Hadoop and Spark jobs.  
👉 Use **Hive Metastore with Derby** (or integrate with MySQL/PostgreSQL).  
👉 [Modify the cluster owner's name.](#-modify-the-owner-name)  

---

## 🔧 **Tech Stack**  
- **Hadoop** (HDFS, YARN)  
- **Spark** (Standalone Mode)  
- **Apache Hive** (With Derby Metastore)  
- **Apache Pig**  
- **Docker** (Containerized Setup)  

---

## 🖥️ **OS Support**  
- 🪟 **Windows** (via WSL2 or Docker Desktop)  
- 🐧 **Linux** (Ubuntu, CentOS, Debian)  

---

## 📌 **Prerequisites**  
- 🐳 **Docker**  
- 🗃️ **Basic Knowledge of Hadoop, Spark, Hive, Pig**  

---

## 🚀 **Installation Guide**  

### **Step 1: Clone the Repository**  
```sh
git clone https://github.com/huy-dataguy/HadoopSphere.git
cd HadoopShere
```

### **Step 2: Build Docker Images**  
Building Docker images is required only for the first time or after making changes in the HaMu directory (such as [modifying the owner name](#modify-the-owner-name)). Make sure Docker is running before proceeding.

> **⏳ Note:** The first build may take a few minutes as no cached layers exist.  

#### 🪟 **For Windows**  
```sh
.\windows\build-image.bat
```

#### 🐧 **For Linux**  
```sh
./linux/build-image.sh
```

---

### **Step 3: Start the Cluster**  

#### 🪟 **For Windows**  
```sh
.\windows\start-cluster.bat
```

#### 🐧 **For Linux**  
```sh
./linux/start-cluster.sh
```

*By default, this will start a cluster with **1 master and 2 slaves**.*  

To start a cluster with **1 master and 5 slaves**:  
```sh
./linux/start-cluster.sh 6    # 🐧 Linux  
.\windows\start-cluster.bat 6 # 🪟 Windows  
```

---

### **Step 4: Verify the Installation**  

After **Step 3**, you will be inside the **master container's CLI**, where you can interact with the cluster.


💡 **Start the HDFS services:**  
```sh
start-dfs.sh
```
💡 **Check HDFS Nodes**  
```sh
hdfs dfsadmin -report
```

💡 **Start the YARN services:**  
```sh
start-yarn.sh
```
💡 **Check YARN Nodes**  
```sh
yarn node -list
```

💡 **Check Spark Cluster**  
```sh
spark-shell
```

💡 **Check Hive Metastore**  
```sh
hive
```

💡 **Run a Pig Script**  
```sh
pig -x mapreduce
```

📌 Expected Output:
![Deme](https://github.com/user-attachments/assets/a79645b2-84bd-4f7e-aa7b-7bb5bf9474e5)

If you see live DataNodes, your cluster is running successfully. 🚀

---

## 🔄 **Modify the Owner Name**  
If you need to change the owner name, run the `rename-owner.py` script and enter your new owner name when prompted.  

> **⏳ Note:** If you want to check the current owner name, it is stored in `OwnerName.txt`.
>
> 📌 There are some limitations; you should use a name that is different from words related to the 'Hadoop' or 'Docker' syntax. For example, avoid names like 'hdfs', 'yarn', 'container', or 'docker-compose'.

```sh
python rename-owner.py
```
---

## 🌐 **Interact with the Web UI**  

🔹 **Hadoop NameNode UI** → [http://localhost:9870](http://localhost:9870)
    Provides an overview of cluster resource usage, running applications, and job details.   
🔹 **YARN Resource Manager UI** → [http://localhost:8088](http://localhost:8088)  
🔹 **Spark UI** → [http://localhost:4040](http://localhost:4040)  
    Displays HDFS file system details, block distribution, and overall health status.
---

## ✨ **Contributors**  

| Contributor | Role |
|-------------|------|
| [@Quang Nguyen](https://github.com/DOCUTEE) | Original HaMu Creator |
| [@Quoc Huy Nguyen](https://github.com/huy-dataguy) | Spark, Hive, Pig Integration |

---

## 📞 **Contact**  
📧 Email: quochuy.working@gmail.com  

💬 Feel free to contribute and improve this project! 🚀























