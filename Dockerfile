FROM fedora:25

MAINTAINER Karsten Hopp, Red Hat <karsten@redhat.com>
LABEL name="chronyd container" \
      vendor="Fedora Project" \
      Release="1" \
      version="1.0" \
      architecture="x86_64" \
      authoritative-source-url="registry.fedoraproject.org" \
      org.fedoraproject.component="ntp-container" \
      io.k8s.description="A container with the chrony NTP time server" \
      io.k8s.display-name="NTP server (chrony)" 

RUN dnf install -y chrony && \
 chronyc keygen > /etc/chrony.keys && \
 sed -i "s/^pool/#pool/g" /etc/chrony.conf && \
 sed -i "s/^server/#server/g" /etc/chrony.conf && \
 echo "allow all" >> /etc/chrony.conf && \
 dnf clean all

USER 0
CMD ["/usr/sbin/chronyd","-d"]

EXPOSE 123
