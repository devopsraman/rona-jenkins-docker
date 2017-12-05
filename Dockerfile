FROM docker.gillsoft.org/jenkinsci

LABEL maintainer="Ronan Gill <ronan.gill@gillsoft.org>"

USER root

RUN dpkg-query -l  | grep docker | xargs -r apt-get purge
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg  -o /tmp/docker.gpg
RUN apt-key add /tmp/docker.gpg
RUN rm /tmp/docker.gpg
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu zesty stable"
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get install -y docker-ce
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN usermod -a -G staff,docker jenkins

VOLUME ["/var/lib/docker"]

USER jenkins
