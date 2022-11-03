FROM ubuntu:latest AS sandbox-server

RUN apt update && apt install  openssh-server sudo -y

RUN useradd -rm -d /home/sandbox -s /bin/bash -g root -G sudo -u 1000 sandbox 

RUN  echo 'sandbox:sandbox' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]