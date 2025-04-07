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



## 👥 Authors

- [@Quang Nguyen](https://github.com/DOCUTEE)

## ✨ Features  

- Deploy a Hadoop multi-node cluster with a single command.  
- Customize the number of slave nodes.  
- [Set the cluster owner's name.](#modify-the-owner-name)
- [Interact with the cluster via CLI or Web UI.](#-interact-with-the-web-ui)

## 🖥️ **OS Support**  
- 🪟 **Windows** (via WSL2 or Docker Desktop)  
- 🐧 **Linux** (Ubuntu, CentOS, Debian, etc.) – ⏳ *Coming Soon*  

## 📌 **Prerequisites** 
- 🐳 **Docker**  
- 🗃️ **Basic Knowledge of Hadoop**  

## 🚀 Installation Guide  
**Please select one of the two options !**

<a href="windows/README.md">
    <img src="https://github.com/user-attachments/assets/f23de778-a10f-4646-9acd-a9aaa65abd23" alt="Windows" style="width: 20%; max-width: 300px; height: auto;">
</a>
<a href="linux/README.md">
    <img src="https://github.com/user-attachments/assets/d24f7f6e-20d3-44a9-b3af-47c2b4bf9011" alt="Linux" style="width: 20%; max-width: 300px; height: auto;">
</a>


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

