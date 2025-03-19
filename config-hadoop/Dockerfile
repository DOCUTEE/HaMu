FROM hadoop-master1

USER hadoopminhquang
WORKDIR /home/hadoopminhquang


COPY master/config/workers /home/hadoopminhquang/hadoop/etc/hadoop/workers

USER root
# Convert files to Unix format
RUN dos2unix /home/hadoopminhquang/hadoop/etc/hadoop/workers

# Format HDFS
USER hadoopminhquang
RUN hdfs namenode -format

USER root
# Start SSH and Hadoop services
CMD ["/bin/bash", "-c", "service ssh start && su - hadoopminhquang && bash"]
