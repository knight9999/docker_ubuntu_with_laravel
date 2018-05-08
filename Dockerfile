FROM knaito/ubuntu_with_lamp:1.2

MAINTAINER KENICHI NAITO

ENV DEBIAN_FRONTEND noninteractive

COPY files/etc /etc/

RUN apt-get update -y

RUN apt-get install -y systemd

COPY files/entry-script.bash /entry-script.bash

RUN useradd -s /bin/bash client

USER client

RUN composer global require "laravel/installer"

RUN mkdir /home/client/work

COPY files/bash_profile.txt /home/client/.bash_profile

USER root

RUN a2enmod rewrite

COPY files/.vimrc /root/.vimrc

CMD ["/entry-script.bash"]
