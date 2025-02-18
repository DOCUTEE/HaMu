# Base Image
FROM ubuntu:22.04

LABEL maintainer="DOCUTEE <work.docutee@outlook.com>"

# Set root password
RUN echo "root:root" | chpasswd

# Update and install required packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y openjdk-8-jdk wget ssh openssh-server vim && \
    apt-get clean

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV HADOOP_HOME=/home/hadoopphuongngan/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin

# Configure SSH
RUN ssh-keygen -A && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    mkdir -p /var/run/sshd

# Create user hadoopphuongngan
RUN adduser --disabled-password --gecos "" hadoopphuongngan && \
    echo "hadoopphuongngan:hadoopphuongngan" | chpasswd && \
    usermod -aG sudo hadoopphuongngan && \
    echo "hadoopphuongngan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Hadoop
USER hadoopphuongngan
WORKDIR /home/hadoopphuongngan
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz && \
    tar -xzf hadoop-3.4.1.tar.gz && \
    mv hadoop-3.4.1 hadoop && \
    rm hadoop-3.4.1.tar.gz

# Set JAVA_HOME in hadoop-env.sh
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/hadoopphuongngan/hadoop/etc/hadoop/hadoop-env.sh

# Configure bashrc
# RUN echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export HADOOP_HOME=/home/hadoopphuongngan/hadoop" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export PATH=\$PATH:\$HADOOP_HOME/bin" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export PATH=\$PATH:\$HADOOP_HOME/sbin" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export HADOOP_MAPRED_HOME=\$HADOOP_HOME" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export HADOOP_COMMON_HOME=\$HADOOP_HOME" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export HADOOP_HDFS_HOME=\$HADOOP_HOME" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export HADOOP_CONF_DIR=\$HADOOP_HOME/etc/hadoop" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export HADOOP_YARN_HOME=\$HADOOP_HOME" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export HADOOP_COMMON_LIB_NATIVE_DIR=\$HADOOP_HOME/lib/native" >> /home/hadoopphuongngan/.bashrc && \
#     echo "export HADOOP_OPTS=\"-Djava.library.path=\$HADOOP_HOME/lib/native\"" >> /home/hadoopphuongngan/.bashrc
    

# Copy Hadoop configuration files
COPY config/.bashrc /home/hadoopphuongngan/.bashrc
COPY config/core-site.xml /home/hadoopphuongngan/hadoop/etc/hadoop/core-site.xml
COPY config/hdfs-site.xml /home/hadoopphuongngan/hadoop/etc/hadoop/hdfs-site.xml
COPY config/yarn-site.xml /home/hadoopphuongngan/hadoop/etc/hadoop/yarn-site.xml

# COPY files in ssh folder to /home/hadoopphuongngan/.ssh
COPY config/ssh/* /home/hadoopphuongngan/.ssh/

# Add permission to ssh folder
USER root
RUN chmod 700 /home/hadoopphuongngan/.ssh/ && \
    chmod 600 /home/hadoopphuongngan/.ssh/authorized_keys && \
    chown -R hadoopphuongngan:hadoopphuongngan /home/hadoopphuongngan/.ssh

# Install dos2unix
RUN apt-get update && apt-get install -y dos2unix && apt-get clean

# Convert files to Unix format
RUN dos2unix /home/hadoopphuongngan/.bashrc && \
    dos2unix /home/hadoopphuongngan/hadoop/etc/hadoop/core-site.xml && \
    dos2unix /home/hadoopphuongngan/hadoop/etc/hadoop/hdfs-site.xml && \
    dos2unix /home/hadoopphuongngan/hadoop/etc/hadoop/yarn-site.xml && \
    dos2unix /home/hadoopphuongngan/.ssh/*

# Start SSH and Hadoop services at runtime
CMD ["bash", "-c", "service ssh start && bash"]