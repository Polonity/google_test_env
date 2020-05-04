FROM jenkins/jenkins:lts
# if we want to install via apt
USER root

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt


# install docker
RUN apt update && apt install -y \
    curl

RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh

# drop back to the regular jenkins user - good practice
USER jenkins 
