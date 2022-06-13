FROM jenkins/jenkins:lts-jdk11

USER root

RUN apt-get update && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt install -y nodejs gnupg2 ca-certificates lsb-release nginx wget && \
    npm install -g @angular/cli && \
    npm install -g sonar-scanner --save-dev && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt install -y ./google-chrome-stable_current_amd64.deb

EXPOSE 80