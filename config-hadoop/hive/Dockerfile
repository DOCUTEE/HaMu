FROM master-spark

USER hadoopquochuy026
WORKDIR /home/hadoopquochuy026/


RUN wget https://dlcdn.apache.org/hive/hive-4.0.1/apache-hive-4.0.1-bin.tar.gz && \
    tar -xvzf apache-hive-4.0.1-bin.tar.gz && \
    mv apache-hive-4.0.1-bin hive && \
    rm apache-hive-4.0.1-bin.tar.gz

COPY .bashrc /home/hadoopquochuy026/.bashrc 
COPY hive-site.xml /home/hadoopquochuy026/hive/conf/ 
COPY hive-env.sh /home/hadoopquochuy026/hive/conf/

RUN bash -c "/home/hadoopquochuy026/hive/bin/schematool -initSchema -dbType derby"


USER root
RUN dos2unix /home/hadoopquochuy026/.bashrc && \
    dos2unix /home/hadoopquochuy026/hive/conf/hive-site.xml && \
    dos2unix /home/hadoopquochuy026/hive/conf/hive-env.sh


CMD ["/bin/bash", "-c", "service ssh start && bash"]



