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
ENV HADOOP_HOME=/home/hadoopminhquang/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin

# Create user hadoopminhquang
RUN adduser --disabled-password --gecos "" hadoopminhquang && \
    echo "hadoopminhquang:hadoopminhquang" | chpasswd && \
    usermod -aG sudo hadoopminhquang && \
    echo "hadoopminhquang ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install Hadoop
USER hadoopminhquang

WORKDIR /home/hadoopminhquang
RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.1/hadoop-3.4.1.tar.gz && \
    tar -xzf hadoop-3.4.1.tar.gz && \
    mv hadoop-3.4.1 hadoop && \
    rm hadoop-3.4.1.tar.gz

# Set JAVA_HOME in hadoop-env.sh
RUN echo "export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64" >> /home/hadoopminhquang/hadoop/etc/hadoop/hadoop-env.sh
    

# Copy Hadoop configuration files
COPY .bashrc /home/hadoopminhquang/.bashrc

RUN mkdir -p /home/hadoopminhquang/.ssh && \
    ssh-keygen -t rsa -P '' -f /home/hadoopminhquang/.ssh/id_rsa && \
    cat /home/hadoopminhquang/.ssh/id_rsa.pub >> /home/hadoopminhquang/.ssh/authorized_keys && \
    chmod 600 /home/hadoopminhquang/.ssh/authorized_keys && \
    chown -R hadoopminhquang:hadoopminhquang /home/hadoopminhquang/.ssh

# Add permission to ssh folder and keys
USER root

# Convert files to Unix format
RUN dos2unix /home/hadoopminhquang/.bashrc 

# Expose ports
EXPOSE 9000 50070 9001 9002 9003 9004 9005 9006 9870 9864 8088 8042
