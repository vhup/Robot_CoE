FROM vhupet/devops_coe_robot:v6.0.0-12

LABEL description Robot Framework in Docker.

# If the lines below are not needed anymore, then I'm not sure that hte JAVA_HOME is used somewhere...
#ENV JAVA_HOME /usr/lib/jvm/jre-21-openjdk
# Those files seems to not be present anymore in Java 21...
#ENV LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server

USER root

# install kafka version required by robot kafkalib
#RUN dnf install -y librdkafka librdkafka-devel python-confluent-kafka

RUN pip3 install \
    --no-cache-dir \
    robotframework-csvlib==1.0.0 \
    robotframework-keepasslibrary==0.7.0.post1 \
    simplejson==3.19.3 \


# Execute all robot tests
CMD ["run-tests-in-virtual-screen.sh"]
