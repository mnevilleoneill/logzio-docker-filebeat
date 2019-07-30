FROM alpine:3.7
MAINTAINER Mike Neville-ONeill <mike.o@logz.io>
ENV REFRESHED_AT 2019-07-30
ENV PACKAGE=filebeat-6.5.4-linux-x86_64.tar.gz

RUN mkdir -p /etc/pki/tls/certs; \
	mkdir -p /usr/share/filebeat; \
	mkdir -p /tmp/filebeat/ 

ADD https://raw.githubusercontent.com/logzio/public-certificates/master/COMODORSADomainValidationSecureServerCA.crt /etc/pki/tls/certs/
ADD https://artifacts.elastic.co/downloads/beats/filebeat/$PACKAGE /tmp/filebeat/$PACKAGE

RUN apk add --update --no-cache libc6-compat tar; \
    tar --strip-components=1 -zxf /tmp/filebeat/$PACKAGE -C /usr/share/filebeat/; \
    rm -rf /tmp/filebeat

COPY filebeat.yml /usr/share/filebeat/filebeat.yml

ENTRYPOINT ["/usr/share/filebeat/filebeat"]
CMD ["-e", "-c", "/usr/share/filebeat/filebeat.yml"]
