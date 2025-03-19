<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->
🚀 **HaMu** is a tool for quickly deploying a fully containerized pseudo-distributed Hadoop cluster, making Hadoop setup faster and easier.

## 📜 Table of Contents  
- 📖 [My Story](#-my-story-feel-free-to-skip)  
- 👥 [Authors](#-authors)  
- ✨ [Features](#-features)
- ✨ [OS support](#%EF%B8%8F-os-support) 
- ✨ [Prerequisites](#-prerequisites)  
- 🚀 [Installation Guide](#-installation-guide)  
- 🔄 [Modify the Owner Name](#modify-the-owner-name)  
- 🌐 [Interact with the Web UI](#-interact-with-the-web-ui)
- ✨ [Contributors](#contributors-)
- 📞 [Contact](#contact)

---

## 📖 **My Story** *(feel free to skip)* 

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

---

## 👥 Authors

- [@Quang Nguyen](https://github.com/DOCUTEE)

## ✨ Features  

- Deploy a Hadoop multi-node cluster with a single command.  
- Customize the number of slave nodes.  
- [Set the cluster owner's name.](#modify-the-owner-name)
- [Interact with the cluster via CLI or Web UI.](#-interact-with-the-web-ui)

---

## 🖥️ **OS Support**  
- 🪟 **Windows** (via WSL2 or Docker Desktop)  
- 🐧 **Linux** (Ubuntu, CentOS, Debian, etc.)

## 📌 **Prerequisites** 
- 🐳 **Docker**  
- 🗃️ **Basic Knowledge of Hadoop**  

---

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

#### 🪟 **For Windows**  
```sh
.\windows\build-image.bat
```

#### 🐧 **For Linux**  
```sh
./linux/build-image.sh
```
---

### **Step 3: Enjoy your Hadoop Cluster**  

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

📌 Expected Output:
- Check HDFS:
![Deme](https://github.com/user-attachments/assets/a79645b2-84bd-4f7e-aa7b-7bb5bf9474e5)

If you see live DataNodes, your cluster is running successfully. 🚀

- Check YARN:
![yarn](https://github.com/user-attachments/assets/b583412a-7874-481c-80aa-16f84bb0cccd)
If you see live NodeManagers, YARN is running successfully. 🚀


### **Step 5: Test the System with Scripts**  
To verify that the system is working correctly after start hdfs and yarn service, you can run the test scripts.

#### **🔹 Step 1: Navigate to the Scripts Directory**  
```sh
cd scripts 
```

#### **🔹 Step 2: Run a Word Count Test**  
```sh
./word_count.sh
```
This script runs a sample **Word Count** job to ensure that HDFS and YARN are functioning correctly.

---

## **📌 Important Notes on Volumes & Containers**  
Since the system uses **Docker Volumes** for **NameNode and DataNode**, ensure:
- **The number of containers remains the same when restarting** (e.g., if started with 5 slaves, restart with 5 slaves).
- If the number of slaves changes, you may face volume inconsistencies.

✅ **How to Ensure the Correct Number of Containers During Restart**:
1. **Always restart with the same number of containers**:
    ```sh
    ./linux/start-cluster.sh 6  # If you previously used 6 nodes
    ```
2. **Do not delete volumes when stopping the cluster**, use:

#### 🪟 **For Windows**  
```sh
.\windows\stop-cluster.bat
```

#### 🐧 **For Linux**  
```sh
./linux/stop-cluster.sh
```
  Avoid using `docker compose -f compose-dynamic.yaml down -v` as it will remove NameNode & DataNode data.

✅ **Check Existing Volumes**:
```sh
docker volume ls | grep hdfs
```


🚀 **If the Word Count job runs successfully, your system is fully operational!**

---

### Modify the Owner Name  
If you need to change the owner name, run the `rename-owner.py` script and enter your new owner name when prompted.  

> **⏳ Note:** If you want to check the current owner name, it is stored in `OwnerName.txt`.
>
> 📌 There are some limitations; you should use a name that is different from words related to the 'Hadoop' or 'Docker' syntax. For example, avoid names like 'hdfs', 'yarn', 'container', or 'docker-compose'.

```sh
python rename-owner.py
```

### 🌐 Interact with the Web UI  

You can access the following web interfaces to monitor and manage your Hadoop cluster:  

- **YARN Resource Manager UI** → [http://localhost:9004](http://localhost:9004)  
  Provides an overview of cluster resource usage, running applications, and job details.  

- **NameNode UI** → [http://localhost:9870](http://localhost:9870)  
  Displays HDFS file system details, block distribution, and overall health status.  





    

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/huy-dataguy"><img src="https://avatars.githubusercontent.com/u/150227535?v=4?s=100" width="100px;" alt="Nguyen Quoc Huy"/><br /><sub><b>Nguyen Quoc Huy</b></sub></a><br /><a href="https://github.com/DOCUTEE/HaMu/commits?author=huy-dataguy" title="Code">💻</a></td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td align="center" size="13px" colspan="7">
        <img src="https://raw.githubusercontent.com/all-contributors/all-contributors-cli/1b8533af435da9854653492b1327a23a4dbd0a10/assets/logo-small.svg">
          <a href="https://all-contributors.js.org/docs/en/bot/usage">Add your contributions</a>
        </img>
      </td>
    </tr>
  </tfoot>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## Contact

📧 Email: quangforwork1203@gmail.com  

💬 My project still has many aspects that need improvement. I would greatly appreciate your feedback!






