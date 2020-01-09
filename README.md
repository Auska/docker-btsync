# 我的博客
http://blog.auska.win

## 创建镜像

```
docker create --name=btsync \
-v <path to sync>:/mnt \
-v <path to config>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 8888:8888 -p 50000:50000 \
auska/docker-btsync:latest
```

```
docker create --name=rslsync \
-v <path to downloads>:/downloads \
-v <path to sync>:/mnt \
-v <path to config>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 8888:8888 -p 50000:50000 \
auska/docker-btsync:rslsync
```

## 参数解释

* `-p 8888` 网页UI端口
* `-p 50000` - 软件通讯端口
* `-v /config` - 配置文件目录
* `-v /downloads` - 下载文件目录
* `-v /mnt` - 文件目录
* `-e PGID` 用户的GroupID，留空为root
* `-e PUID` 用户的UserID，留空为root
* `-e TZ` 时区 默认 Asia/Shanghai

## 版本介绍

latest ： 为老的btsync版本（带DHT功能）
resilio:  为新的resilio sync版本
