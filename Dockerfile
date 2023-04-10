FROM jenkins/jnlp-slave:4.13.3-1-jdk11

USER root

RUN apt update \
  &&  apt install apt-transport-https ca-certificates curl software-properties-common \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" \
  && apt-cache policy docker-ce \
  && apt install docker-ce \
  && apt-get autoremove
