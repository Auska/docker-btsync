FROM lsiobase/alpine:3.11

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="blog.auska.win version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Auska"

ENV GLIBC_VERSION=2.30-r0 TZ=Asia/Shanghai

ADD https://download-cdn.resilio.com/2.6.4/linux-x64/resilio-sync_x64.tar.gz /tmp/sync.tgz

RUN \
 echo "**** install packages ****" && \
 cd /tmp \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
 apk add --allow-untrusted glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
 rm -r *.apk && \
 tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 28888 50000
VOLUME /config /mnt
