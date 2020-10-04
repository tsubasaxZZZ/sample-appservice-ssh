FROM ubuntu:18.04
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update \
&& apt-get install -y --no-install-recommends openssh-server postgresql-client nodejs redis \
&& echo "root:Docker!" | chpasswd
COPY main.js /opt
COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/init.sh
EXPOSE 80 2222
ENTRYPOINT ["init.sh"]
