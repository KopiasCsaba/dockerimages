FROM centos:centos7

MAINTAINER Kopiás Csaba <csaba.replacethis.kopias.replacethis.net>

# Inform about software versions being used inside the builder
ENV PERCONA_VERSION="5.5"

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Percona Server" \
      io.k8s.display-name="Percona Server 5.5" \
      io.openshift.expose-services="3306:tcp/mysql" \
      io.openshift.tags="database"


RUN useradd --uid 1001 -ms /bin/bash user


RUN yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm;\
yum install -y nano Percona-Server-server-55 Percona-Server-client-55; \
yum remove -y vim-minimal ; \
 yum clean all -y; 
 #systemctl disable mysql.service; systemctl stop mysql


# RUN whoami

USER user
WORKDIR /home/user

RUN mkdir -p mysql/data/;
COPY ./config/my.cnf mysql/my.cnf
COPY ./mysql.start.sh mysql/mysql.start.sh


# /usr/bin/mysqladmin -u root password 'new-password'
# /usr/bin/mysqladmin -u root -h 72bde90e025e password 'new-password'
# 
# Alternatively you can run:
# /usr/bin/mysql_secure_installatio



# 
# RUN chown -R user:user /home/user/mysql;

VOLUME /home/user/mysql/data

EXPOSE 3306

CMD ["mysql/mysql.start.sh"]
