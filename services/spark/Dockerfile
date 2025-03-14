FROM hdsphere-hive

USER hadoopquochuy026
WORKDIR /home/hadoopquochuy026

RUN sudo apt-get update && sudo apt-get install -y python3


RUN wget https://dlcdn.apache.org/spark/spark-3.4.4/spark-3.4.4-bin-hadoop3.tgz && \
    tar -xvzf spark-3.4.4-bin-hadoop3.tgz && \
    mv spark-3.4.4-bin-hadoop3 spark && \
    rm spark-3.4.4-bin-hadoop3.tgz


RUN sudo apt-get update && sudo apt-get install -y curl zip unzip

COPY /services/.bashrc /home/hadoopquochuy026/.bashrc

RUN curl -s "https://get.sdkman.io" | bash && \
    echo 'source "/home/hadoopquochuy026/.sdkman/bin/sdkman-init.sh"' >> /home/hadoopquochuy026/.bashrc && \
    bash -c "source /home/hadoopquochuy026/.sdkman/bin/sdkman-init.sh && sdk install scala 2.12.17"

USER root
RUN dos2unix /home/hadoopquochuy026/.bashrc 

CMD ["/bin/bash", "-c", "service ssh start && bash"]

