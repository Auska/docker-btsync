FROM lsiobase/alpine:3.8

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="blog.auska.win version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Auska"

ENV GLIBC_VERSION=2.28-r0 TZ=Asia/Shanghai NETWORK=446b538c9d8ca1d3

RUN \
 echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
 echo "**** install packages ****" && \
 apk add --no-cache \
	wget \
	tar \
	zerotier-one && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
 wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
 apk add --allow-untrusted glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
 apk del wget

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 8888 54545
VOLUME /btsync /mnt
