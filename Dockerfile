FROM jenkins:2.46.3

USER root
RUN apt-get update

# install jq
RUN curl -o /usr/local/bin/jq -L https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
    chmod +x /usr/local/bin/jq

# install docker
RUN apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"
RUN apt-get update
RUN apt-get -y install docker-ce

# install docker -compose
RUN curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# install sshpass
RUN apt-get -y install sshpass

USER jenkins
ENV TZ Asia/Tokyo

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
