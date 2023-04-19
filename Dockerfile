FROM jenkins/jnlp-slave:4.13.3-1-jdk11

USER root

RUN  apt-get update \
  && apt-get install -y gnupg2 \
  && echo 'deb http://deb.debian.org/debian buster-backports main' >> /etc/apt/sources.list \
  && echo 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list \
  && curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/Release.key |  apt-key add - \
  && apt-get update \
  && apt-get -y -t buster-backports install libseccomp2 \
  && apt-get -y install podman \
  && curl https://baltocdn.com/helm/signing.asc | gpg --dearmor |  tee /usr/share/keyrings/helm.gpg > /dev/null \
  && apt-get install apt-transport-https --yes \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" |  tee /etc/apt/sources.list.d/helm-stable-debian.list \
  && apt-get update \
  && apt-get install helm \
  && apt-get autoremove 
