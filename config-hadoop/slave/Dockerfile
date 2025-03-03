# Base Image
FROM hadoop-base1

USER hadoopminhquang
WORKDIR /home/hadoopminhquang


# Copy Hadoop configuration files
COPY config/core-site.xml /home/hadoopminhquang/hadoop/etc/hadoop/core-site.xml
COPY config/hdfs-site.xml /home/hadoopminhquang/hadoop/etc/hadoop/hdfs-site.xml
COPY config/yarn-site.xml /home/hadoopminhquang/hadoop/etc/hadoop/yarn-site.xml
COPY config/mapred-site.xml /home/hadoopminhquang/hadoop/etc/hadoop/mapred-site.xml

USER root
# Convert files to Unix format
RUN dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/core-site.xml && \
    dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/hdfs-site.xml && \
    dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/yarn-site.xml && \
    dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/mapred-site.xml
# Format HDFS
USER hadoopminhquang
RUN hdfs namenode -format


USER root
# Start SSH and Hadoop services at runtime
CMD ["/bin/bash", "-c", "service ssh start && su - hadoopminhquang && bash"]
