FROM jenkins/jenkins:2.440.3-jdk17
USER root

RUN apt-get update && apt-get install -y \
    lsb-release \
    python3 \
    python3-pip \
    python3.11-venv \
    && rm -rf /var/lib/apt/lists/* \
    && chown -R jenkins:jenkins /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share /usr/bin/python3 /usr/bin/pip3

RUN python3 -m venv /home/jenkins/venv
ENV PATH="/home/jenkins/venv/bin:$PATH"

RUN /home/jenkins/venv/bin/pip install pyinstaller

RUN apt-get update && apt-get install -y lsb-release

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli

USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"