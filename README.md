# 🚀 HadoopSphere
A fully containerized **Hadoop, Spark, Hive, and Pig** environment for quick and efficient Big Data processing.  

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)  

## 🐜 Table of Contents  
- 📚 [My Story](#-my-story-feel-free-to-skip)  
- 👥 [Authors](#-authors)  
- ✨ [Features](#-features)  
- 🔧 [Tech Stack](#-tech-stack)  
- 🎥 [OS Support](#-os-support)  
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
- [@Huy Nguyen](https://github.com/huy-dataguy) *(Extended with Spark, Hive, Pig)*  

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

## 🎥 **OS Support**  
- 🪠 **Windows** (via WSL2 or Docker Desktop)  
- 🐛 **Linux** (Ubuntu, CentOS, Debian)  

---

## 📌 **Prerequisites**  
- 💪 **Docker**  
- 📂 **Basic Knowledge of Hadoop, Spark, Hive, Pig**  

---

## 🚀 **Installation Guide**  

### **Step 1: Clone the Repository**  
```sh
git clone https://github.com/huy-dataguy/HadoopSphere.git
cd HadoopShere
```

### **Step 2: Build Docker Images**  

#### 🪠 **For Windows**  
```sh
.\windows\build-image.bat
```

#### 🐬 **For Linux**  
```sh
./linux/build-image.sh
```

---

### **Step 3: Start the Cluster**  

#### 🪠 **For Windows**  
```sh
.\windows\start-cluster.bat
```

#### 🐬 **For Linux**  
```sh
./linux/start-cluster.sh
```

*By default, this will start a cluster with **1 master and 2 slaves**.*  

To start a cluster with **1 master and 5 slaves**:  
```sh
./linux/start-cluster.sh 6    # Linux  
.\windows\start-cluster.bat 6 # Windows  
```

---

### **Step 4: Verify the Installation**  

After starting the cluster, access the **master container** and run the following commands:  

💡 **Check HDFS Nodes**  
```sh
hdfs dfsadmin -report
```

💡 **Check Spark Cluster**  
```sh
spark-shell
```

💡 **Check Hive Metastore**  
```sh
schematool -dbType derby -info
```

💡 **Run a Pig Script**  
```sh
pig -x mapreduce
```
---

## 🔄 **Modify the Owner Name**  
To change the cluster owner's username, run:  
```sh
python rename-owner.py
```

---

## 🌐 **Interact with the Web UI**  

🔹 **Hadoop NameNode UI** → [http://localhost:9870](http://localhost:9870)  
🔹 **YARN Resource Manager UI** → [http://localhost:8088](http://localhost:8088)  
🔹 **Spark UI** → [http://localhost:4040](http://localhost:4040)  

---

## ✨ **Contributors**  

| Contributor | Role |
|-------------|------|
| [@Quang Nguyen](https://github.com/DOCUTEE) | Original HaMu Creator |
| [@Huy Nguyen](https://github.com/huy-dataguy) | Spark, Hive, Pig Integration |

---

## 📞 **Contact**  
📧 Email: quochuy.working@gmail.com  

💬 Feel free to contribute and improve this project! 🚀























