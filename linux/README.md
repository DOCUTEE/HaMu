Follow these steps to install and run HaMu on your system.  

### **Step 1: Clone the Repository**  
First, download the HaMu repository to your local machine:  
```sh
git clone https://github.com/DOCUTEE/HaMu.git
cd HaMu
```

### **Step 2: Build Docker Images (Optional)**  
Building Docker images is required only for the first time or after making changes in the HaMu directory (such as [modifying the owner name](https://github.com/DOCUTEE/HaMu?tab=readme-ov-file#modify-the-owner-name)). Make sure Docker is running before proceeding.

> **⏳ Note:**
> 
> * The first build may take a few minutes as no cached layers exist.
> 
> * You need to add execution permission `chmod +x linux/*` to these files in the linux folder.
> 
> * If you don't have enough permissions, you may need to run the command as a superuser `sudo`.

```sh
./linux/build-image.sh
```

### **Step 3: Enjoy your Hadoop Cluster**  
By default, running the command below will launch a Hadoop cluster with 3 nodes (1 master and 2 slaves):
```sh
./linux/start-cluster.sh
```
If you want to customize the number of slave nodes, specify the total number of nodes (master + slaves) as an argument.
For example, to start a cluster with 1 master and 5 slaves (6 nodes total):
```sh
./linux/start-cluster.sh 6
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
