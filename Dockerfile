FROM lsiobase/alpine:3.12

# set version label
LABEL maintainer="Auska"

ENV GLIBC_VERSION=2.32-r0 TZ=Asia/Shanghai PORT=8888

ADD https://github.com/Auska/Files/raw/main/BitTorrent%20Sync%202.1.4/BitTorrent-Sync_x64.tar.gz /tmp/sync.tgz

RUN \
 echo "**** install packages ****" && \
 cd /tmp && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
 apk add --allow-untrusted glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
 rm -f *.apk && \
 tar -xf /tmp/sync.tgz -C /usr/bin btsync && rm -f /tmp/sync.tgz

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8888 50000
VOLUME /config /media