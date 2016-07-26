FROM jenkins:2.7.1

USER root

RUN apt-get update \
    && apt-get install -y apt-transport-https \
    && rm -rf /var/lib/apt/lists/*
    
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' >> /etc/apt/sources.list.d/docker.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      apparmor \
      ca-certificates \
      docker-engine \
      git-core \
      php5-cli \
      php5-curl \
      sudo \
    && rm -rf /var/lib/apt/lists/*

RUN usermod -aG docker jenkins

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN echo "Asia/Phnom_Penh" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

USER jenkins