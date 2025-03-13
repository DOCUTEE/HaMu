FROM hadoop-master1

# Switch to root to perform installations and file operations
USER root
WORKDIR /home/hadoopquochuy026

# Download and extract Spark, then clean up
RUN wget https://dlcdn.apache.org/spark/spark-3.4.4/spark-3.4.4-bin-hadoop3.tgz && \
    tar -xvzf spark-3.4.4-bin-hadoop3.tgz && \
    mv spark-3.4.4-bin-hadoop3 spark && \
    rm spark-3.4.4-bin-hadoop3.tgz

# Update package list and install required packages
RUN apt-get update && apt-get install -y curl zip unzip

# Copy the .bashrc file and set its ownership to hadoopquochuy026 directly
COPY --chown=hadoopquochuy026:hadoopquochuy026 .bashrc /home/hadoopquochuy026/.bashrc

# Switch to the non-root user for SDKMAN installation
USER hadoopquochuy026

# Install SDKMAN and use it to install Scala
RUN curl -s "https://get.sdkman.io" | bash && \
    echo 'source "/home/hadoopquochuy026/.sdkman/bin/sdkman-init.sh"' >> /home/hadoopquochuy026/.bashrc && \
    bash -c "source /home/hadoopquochuy026/.sdkman/bin/sdkman-init.sh && sdk install scala 2.12.17"

# Switch back to root to run dos2unix on .bashrc
USER root
RUN dos2unix /home/hadoopquochuy026/.bashrc 

# Start SSH and launch an interactive bash shell when the container starts
CMD ["/bin/bash", "-c", "service ssh start && bash"]
