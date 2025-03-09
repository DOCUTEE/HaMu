FROM hadoop-master1

USER hadoopquochuy026
WORKDIR /home/hadoopquochuy026

# RUN apt-get update && apt-get install -y python3


RUN wget https://dlcdn.apache.org/spark/spark-3.4.4/spark-3.4.4-bin-hadoop3.tgz && \
    tar -xvzf spark-3.4.4-bin-hadoop3.tgz && \
    mv spark-3.4.4-bin-hadoop3 spark && \
    rm spark-3.4.4-bin-hadoop3.tgz

ENV SPARK_HOME=/home/hadoopquochuy026/spark
ENV PATH="$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH"
ENV SPARK_DIST_CLASSPATH="$(hadoop classpath)"

# # Add environment variables to the user's .bashrc for interactive sessions
# RUN echo 'export SPARK_HOME=/home/hadoopquochuy026/spark' >> /home/hadoopquochuy026/.bashrc && \
#     echo 'export PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH' >> /home/hadoopquochuy026/.bashrc && \
#     echo 'export SPARK_DIST_CLASSPATH="$(hadoop classpath)"' >> /home/hadoopquochuy026/.bashrc



RUN sudo apt-get update && sudo apt-get install -y curl zip unzip



RUN curl -s "https://get.sdkman.io" | bash && \
    bash -c "source /home/hadoopquochuy026/.sdkman/bin/sdkman-init.sh && sdk install scala 2.12.17"
USER root
CMD ["/bin/bash", "-c", "service ssh start && bash"]

