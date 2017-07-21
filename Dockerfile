FROM jenkins

MAINTAINER Ronan Gill <ronan.gill@gillsoft.org>

USER root
RUN apt-get -qq update  && \
    apt-get -qq -y install curl && \
    curl -sSL https://get.docker.com/ | sh && \
    usermod -a -G staff,docker jenkins && \
    apt-get clean && \
    rm /bin/sh && ln -s /bin/bash /bin/sh && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jenkins
