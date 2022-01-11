FROM christophettat/robot-framework-base:latest

LABEL DevOps CoE Robot Framework in Docker.

USER root
# Install system dependencies
RUN apk  --no-cache --virtual .build-deps add \
    # Install dependencies for cryptography due to https://github.com/pyca/cryptography/issues/5771
    # cargo \
    # rust \
    # Continue with system dependencies
    gcc \
    g++ \
    libffi-dev \
    linux-headers \
    make \
    musl-dev \
    openssl-dev \
    which \
    wget \
# Additional packages for DevOps CoE
     librdkafka\
     librdkafka-dev\
     libxslt-dev\
     libxml2 \
 && pip3 install \
    --no-cache-dir \
    PyPDF2==1.26.0 \
    PyYAML \
    JayDeBeApi \
    lxml\
    xlrd\
    suds-py3\ 
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
    robotframework-jsonlibrary==0.3.1 \
    robotframework-httplibrary==0.4.2 \
    robotframework-confluentkafkalibrary==1.7.0.post1 \
 #Clean up buildtime dependencies
  && apk del --no-cache --update-cache .build-deps