---
abbrlink: '362'
categories:
  - interesting
cover: 'https://picture.noel.ga/202302161505324.webp'
date: 2022.11.16
description: QEMU能启动那些为不同中央处理器编译的Linux程序，虚拟化模拟器，几乎可以模拟任何硬件设备
tags:
  - qemu虚拟化
title: qemu半虚拟化技术
top_img: 'https://picture.noel.ga/202211210024387.jpg'
updated: 'Thu, 16 Feb 2023 06:52:08 GMT'
aplayer:
aside:
comments:
highlight_shrink:
katex:
keywords:
mathjax:
type:
---
基本原理：用qemu-user半虚拟化技术与Docker技术融合。
实验环境：Ubuntu16.04 (Ubuntu14.04亲测可用) docker version 1.13.0
首先，安装qemu-user安装包，并更新qemu-arm的状态：

```bash
apt-get update && apt-get install -y --no-install-recommends qemu-user-static binfmt-support
update-binfmts --enable qemu-arm
update-binfmts --display qemu-arm
sudo chmod a+x /usr/bin/qemu-*
```

查看qemu-arm的版本：

```bash
qemu-arm-static -version
```

然后下载arm架构的容器：

```bash
docker pull ioft/armhf-ubuntu:trusty
（docker hub上有各类其他版本，也可以下载使用）
docker run -itd --privileged -v /usr/bin/qemu-arm-static:/usr/bin/qemu-arm-static ioft/armhf-ubuntu:trusty /bin/bash（永久有效的容器）
```

最后进入容器访问：

```bash
docker exec -it COTAINER_ID /bin/bash
```

参考文献：
[Run ARM Docker images on x86\_64 hosts](https://blog.ubergarm.com/#/blog/archive/archive-arm-docker-images-on-x86-64)

本文转自 [https://blog.csdn.net/sunSHINEEzy/article/details/80015638](https://blog.csdn.net/sunSHINEEzy/article/details/80015638)，如有侵权，请联系删除。
