# Base Image
FROM ubuntu:22.04

LABEL maintainer="DOCUTEE <work.docutee@outlook.com>"

# Set root password
RUN echo "root:root" | chpasswd

# Update and install required packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y openjdk-8-jdk wget ssh openssh-server vim sudo iputils-ping && \
    apt-get clean

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
ENV HADOOP_HOME=/home/hadoopminhquang/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$JAVA_HOME/bin

# Configure SSH
RUN ssh-keygen -A && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    mkdir -p /var/run/sshd

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
COPY config/.bashrc /home/hadoopminhquang/.bashrc
COPY config/core-site.xml /home/hadoopminhquang/hadoop/etc/hadoop/core-site.xml
COPY config/hdfs-site.xml /home/hadoopminhquang/hadoop/etc/hadoop/hdfs-site.xml
COPY config/mapred-site.xml /home/hadoopminhquang/hadoop/etc/hadoop/mapred-site.xml
COPY config/yarn-site.xml /home/hadoopminhquang/hadoop/etc/hadoop/yarn-site.xml
COPY config/workers /home/hadoopminhquang/hadoop/etc/hadoop/workers

# Copy files in ssh folder to /home/hadoopminhquang/.ssh
COPY config/ssh/* /home/hadoopminhquang/.ssh/

# Add permission to ssh folder and keys
USER root
RUN chmod 700 /home/hadoopminhquang/.ssh && \
    chmod 600 /home/hadoopminhquang/.ssh/id_rsa && \
    chmod 644 /home/hadoopminhquang/.ssh/id_rsa.pub && \
    chmod 600 /home/hadoopminhquang/.ssh/authorized_keys && \
    chown -R hadoopminhquang:hadoopminhquang /home/hadoopminhquang/.ssh


# Install dos2unix
RUN apt-get update && apt-get install -y dos2unix && apt-get clean

# Convert files to Unix format
RUN dos2unix /home/hadoopminhquang/.bashrc && \
    dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/core-site.xml && \
    dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/hdfs-site.xml && \
    dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/yarn-site.xml && \
    dos2unix /home/hadoopminhquang/.ssh/* && \
    dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/mapred-site.xml && \
    dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/workers

# Format HDFS
USER hadoopminhquang
RUN hdfs namenode -format

USER root
# Expose ports
EXPOSE 9000 9001 9002 9003 9004 9005 9006 9870 9864 8088 8042

# Start SSH and Hadoop services
CMD ["/bin/bash", "-c", "service ssh start && su - hadoopminhquang && bash"]
