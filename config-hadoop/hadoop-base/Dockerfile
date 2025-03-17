# Base Image
FROM ubuntu:22.04

LABEL maintainer="DOCUTEE <work.docutee@outlook.com>"

# Set root password
RUN echo "root:root" | chpasswd

# Update and install required packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y openjdk-8-jdk wget ssh openssh-server dos2unix vim sudo telnet iputils-ping && \
    apt-get clean

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV HADOOP_HOME=/home/hadoopquochuy026/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin

# Create user hadoopquochuy026
RUN adduser --disabled-password --gecos "" hadoopquochuy026 && \
    echo "hadoopquochuy026:hadoopquochuy026" | chpasswd && \
    usermod -aG sudo hadoopquochuy026 && \
    echo "hadoopquochuy026 ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Hadoop
USER hadoopquochuy026

WORKDIR /home/hadoopquochuy026
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz && \
    tar -xzf hadoop-3.4.1.tar.gz && \
    mv hadoop-3.4.1 hadoop && \
    rm hadoop-3.4.1.tar.gz

# Set JAVA_HOME in hadoop-env.sh
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/hadoopquochuy026/hadoop/etc/hadoop/hadoop-env.sh
    

# Copy Hadoop configuration files
COPY .bashrc /home/hadoopquochuy026/.bashrc

RUN mkdir -p /home/hadoopquochuy026/.ssh && \
    ssh-keygen -t rsa -P '' -f /home/hadoopquochuy026/.ssh/id_rsa && \
    cat /home/hadoopquochuy026/.ssh/id_rsa.pub >> /home/hadoopquochuy026/.ssh/authorized_keys && \
    chmod 600 /home/hadoopquochuy026/.ssh/authorized_keys && \
    chown -R hadoopquochuy026:hadoopquochuy026 /home/hadoopquochuy026/.ssh

# Add permission to ssh folder and keys
USER root

# Convert files to Unix format
RUN dos2unix /home/hadoopquochuy026/.bashrc 

# Expose ports
EXPOSE 9000 50070 9001 9002 9003 9004 9005 9006 9870 9864 8088 8042 8080 7070 4040
