# Base Image
FROM hadoop-base1

USER hadoopquochuy026
WORKDIR /home/hadoopquochuy026

# Copy Hadoop configuration files
COPY config/core-site.xml /home/hadoopquochuy026/hadoop/etc/hadoop/core-site.xml
COPY config/hdfs-site.xml /home/hadoopquochuy026/hadoop/etc/hadoop/hdfs-site.xml
COPY config/mapred-site.xml /home/hadoopquochuy026/hadoop/etc/hadoop/mapred-site.xml
COPY config/yarn-site.xml /home/hadoopquochuy026/hadoop/etc/hadoop/yarn-site.xml
COPY config/workers /home/hadoopquochuy026/hadoop/etc/hadoop/workers

USER root
# Convert files to Unix format
RUN dos2unix /home/hadoopquochuy026/hadoop/etc/hadoop/core-site.xml && \
    dos2unix /home/hadoopquochuy026/hadoop/etc/hadoop/hdfs-site.xml && \
    dos2unix /home/hadoopquochuy026/hadoop/etc/hadoop/yarn-site.xml && \
    dos2unix /home/hadoopquochuy026/hadoop/etc/hadoop/mapred-site.xml && \
    dos2unix /home/hadoopquochuy026/hadoop/etc/hadoop/workers

# Format HDFS
USER hadoopquochuy026
RUN hdfs namenode -format

USER root
# Start SSH and Hadoop services
CMD ["/bin/bash", "-c", "service ssh start && su - hadoopquochuy026 && bash"]
