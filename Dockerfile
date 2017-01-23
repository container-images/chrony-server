FROM fedora:latest

MAINTAINER Karsten Hopp, Red Hat <karsten@redhat.com>

RUN dnf install -y chrony && \
 chronyc keygen > /etc/chrony.keys && \
 sed -i "s/^pool/#pool/g" /etc/chrony.conf && \
 sed -i "s/^server/#server/g" /etc/chrony.conf && \
 echo "allow all" >> /etc/chrony.conf && \
 rm -rvf /var/cache/{dnf,yum}/*

# echo "port 123123" >> /etc/chrony.conf && \

CMD ["/usr/sbin/chronyd","-d"]

EXPOSE 123
