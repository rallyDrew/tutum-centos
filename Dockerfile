FROM centos:latest
MAINTAINER Feng Honglin <hfeng@tutum.co>

RUN yum -y install openssh-server epel-release && \
    yum -y install pwgen && \
    yum -y install gcc g++ make automake autoconf

RUN yum -y install curl-devel openssl-devel zlib-devel httpd-devel && \
    yum -y install  apr-devel apr-util-devel sqlite-devel && \
    yum -y install java zsh git wget gcc-c++ ruby ruby-devel

RUN rm -f /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/UsePAM.*/UsePAM yes/g" /etc/ssh/sshd_config && \
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    chsh -s /bin/zsh && \
    wget wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz && \
    tar zxf node-v0.10.35.tar.gz && \
    cd node-v0.10.35.tar.gz && \
    ./configure && \
    make && \
    make install && \
    gem update --no-ri --no-rdoc && \
    gem install rails --no-ri --no-rdoc

ADD set_root_pw.sh /set_root_pw.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**

EXPOSE 22
CMD ["/run.sh"]
