FROM jenkins/jnlp-slave:4.13.3-1-jdk11

USER root

RUN apt update \
  &&  curl -fsSL https://get.docker.com -o get-docker.sh \
  && sh ./get-docker.sh \
  && curl https://baltocdn.com/helm/signing.asc | gpg --dearmor |  tee /usr/share/keyrings/helm.gpg > /dev/null \
  && apt-get install apt-transport-https --yes \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" |  tee /etc/apt/sources.list.d/helm-stable-debian.list \
  && apt-get update \
  && apt-get install helm \
  && apt-get autoremove 
