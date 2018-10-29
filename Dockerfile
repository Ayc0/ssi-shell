FROM alpine

RUN apk update && apk upgrade
RUN apk --no-cache add busybox-suid openssh-server
RUN apk --no-cache add zsh nano curl man man-pages
RUN apk --no-cache add python3 nmap nmap-scripts tcpdump sudo
RUN apk --no-cache add gcc musl-dev gdb

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
