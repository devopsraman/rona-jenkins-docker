FROM docker.gillsoft.org/jenkinsci

LABEL maintainer="Ronan Gill <ronan.gill@gillsoft.org>"

USER root

RUN export DEBIAN_FRONTEND=noninteractive && \
    dpkg-query -l  | grep docker | xargs -r apt-get purge && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg  -o /tmp/docker.gpg && \
    apt-key add /tmp/docker.gpg && \
    rm /tmp/docker.gpg && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -yq dist-upgrade && \
    apt-get install -y docker-ce && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    usermod -a -G staff,docker jenkins && \
    unset DEBIAN_FRONTEND

VOLUME ["/var/lib/docker"]

USER jenkins
