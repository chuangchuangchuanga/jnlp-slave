FROM jenkins/jnlp-slave:4.13.3-1-jdk11

USER root

RUN apt update \
  &&  curl -fsSL https://get.docker.com -o get-docker.sh \
  && sh ./get-docker.sh