FROM ppodgorsek/robot-framework:3.7.0


LABEL description Robot Framework in Docker.

ENV EXCELLIB_VERSION 2.0.0
ENV PDF2TEXTLIBRARY_VERSION 1.0.1

USER root

RUN apk --no-cache upgrade \
  && apk --no-cache --virtual .build-deps add \
    gcc \
    g++\
# Install Robot Framework and Selenium Library
&& pip3 install \
    --no-cache-dir \
    robotframework-excellib==$EXCELLIB_VERSION \
    robotframework-pdf2textlibrary==$PDF2TEXTLIBRARY_VERSION \
    PyYAML \
    py2oracle \
&& apk del --no-cache --update-cache .build-deps
# Execute all robot tests
CMD ["run-tests-in-virtual-screen.sh"]
