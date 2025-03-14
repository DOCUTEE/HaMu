FROM hdsphere-master


USER hadoopquochuy026
WORKDIR /home/hadoopquochuy026/


RUN wget https://dlcdn.apache.org/pig/pig-0.17.0/pig-0.17.0.tar.gz && \
    tar -xvzf pig-0.17.0.tar.gz && \
    mv pig-0.17.0 pig && \
    rm pig-0.17.0.tar.gz

COPY /services/.bashrc /home/hadoopquochuy026/.bashrc 

USER root
RUN dos2unix /home/hadoopquochuy026/.bashrc 

CMD ["/bin/bash", "-c", "service ssh start && bash"]



