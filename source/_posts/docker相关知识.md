---
abbrlink: ''
aplayer: null
aside: null
categories:
- - 笔记
comments: null
cover: https://picture.noel.ga/202303071822534.png
date: '2023-03-03 23:14:57'
description: null
highlight_shrink: null
katex: null
keywords: null
mathjax: null
tags:
- 运维
title: docker相关知识
top_img: https://picture.noel.ga/202303071821235.png
type: null
updated: Fri, 03 Mar 2023 15:14:57 GMT
---
## docker容器相关命令

```bash
docker run -p 80:80 -p 443:443 --name nginx  -v /var/lizy/nginx:/etc/nginx/ -d --restart=always nginx  
```

-p 端口映射

--name 容器名字

-v 本地挂载目录

-d 后台执行

--restart = awlways docker启动容器重启

```bash
docker network ls #列出容器网络

docker network rm name #删除容器网络

docker inspect NAMES # 查看容器所有状态信息

docker inspect --format='{{.NetworkSettings.IPAddress}}' # 查看 容器ip 地址

docker inspect --format '{{.Name}} {{.State.Running}}' # 容器运行状态
```

## 防火墙

```bash
systemctl start firewalld #启动

systemctl stop firewalld #关闭

systemctl status firewalld  #查看状态

firewall-cmd --zone=public --add-port=这里是需要开启的端口号/tcp --permanent #开放端口

firewall-cmd --reload #重新加载防火墙

firewall-cmd --list-port #查看防火墙已经开放的端口
```
