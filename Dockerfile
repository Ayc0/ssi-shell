FROM ubuntu

RUN apt update && apt upgrade -y
RUN apt install -y openssh-server
RUN apt install -y zsh nano curl
RUN apt install -y python3 nmap tcpdump sudo
RUN apt install -y gcc musl-dev gdb libc6-i386

RUN echo 'root:qczqdupe9vsiy5cxg923mwiyxm8fkh8' | chpasswd

RUN mkdir /var/run/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

COPY etc /etc
COPY setup.sh /usr/local/
COPY tests /usr/local/tests/
COPY .zshrc /usr/local/
EXPOSE 22

ENTRYPOINT ["zsh", "/usr/local/setup.sh"]
