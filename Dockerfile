FROM fedora:latest

MAINTAINER Karsten Hopp, Red Hat <karsten@redhat.com>

RUN dnf install -y chrony && \
 chronyc keygen > /etc/chrony.keys && \
 echo "allow 0/0" >> /etc/chrony.conf && \
 rm -rvf /var/cache/{dnf,yum}/*

CMD ["/usr/sbin/chronyd","-d"]

EXPOSE 123
