FROM ppodgorsek/robot-framework:latest 

LABEL description Robot Framework in Docker.

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/server

USER root

RUN sed -i -e 's/v3\.12/edge/g' /etc/apk/repositories \
&& apk upgrade --no-cache --available \
&& apk --no-cache --virtual .build-deps add \
    gcc \ 
    g++\
    curl\
    libxml2-dev\
    libxslt-dev\
    librdkafka-dev \
# Upgrade to latest OS libs
#&& apk update \
#&& apk upgrade \
&& pip3 install \
    --no-cache-dir \
    PyPDF2==1.26.0 \
    PyYAML \
    JayDeBeApi \
    lxml\
    xlrd\
    suds-py3\ \
    requests-pkcs12 \
    influxdb \
    jwt \
    jira==3.0.1 \
    requests==2.25.1 \
    confluent-kafka==1.7.0 \
    atlassian-python-api==3.14.1 \
    robotframework-excellib==2.0.0 \
    robotframework-selenium2library==3.0.0 \
    robotframework-pdf2textlibrary==1.0.1 \
    robotframework-archivelibrary \
    robotframework-requests==0.8.0 \
    robotframework-jsonlibrary==0.3.1 \
    robotframework-httplibrary==0.4.2 \
    robotframework-confluentkafkalibrary==1.7.0.post1 \
&& apk del --no-cache --update-cache .build-deps

RUN set -x && apk add --no-cache openjdk8
#COPY ./ojdbc8.jar /lib/ojdbc8.jar
#COPY ./ojdbc6.jar /lib/ojdbc6.jar

# Execute all robot tests
CMD ["run-tests-in-virtual-screen.sh"]
