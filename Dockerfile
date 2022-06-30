FROM debian:bullseye

LABEL maintainer="j4c3k28"

ARG USER=git

RUN apt update \
    && apt install -y --no-install-recommends \
      git \
      openssh-client \
      openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd git \
    && useradd -rm -d /home/$USER -s /bin/bash -g git -u 1000 $USER

COPY start.sh /usr/sbin/start.sh

WORKDIR /git

#USER $USER  # sshd configuration needs some adaptation

VOLUME ["/git", "/home/git/.ssh/"]

EXPOSE 22

ENTRYPOINT ["/usr/sbin/start.sh"]
CMD ["start"]
