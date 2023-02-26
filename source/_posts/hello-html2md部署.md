---
abbrlink: ''
aplayer: null
aside: null
categories:
- - interesting
comments: null
cover: https://picture.noel.ga/202302142136394.jpeg
date: '2023-02-14 21:11:14'
description: 一个前端由vue,后端为node构建的html2md转换网站
highlight_shrink: null
katex: null
keywords: nodejs,网站,html2md
mathjax: null
tags:
- github
- deploy
title: hello-html2md部署
top_img: https://picture.noel.ga/202302142137098.jpeg
type: null
updated: Sun, 26 Feb 2023 07:11:58 GMT
---
# hello-html2md部署

## 简介

**hello-hmtl2md是一个将html转为md文件的工具**

**github地址:**[GitHub - helloworld-Co/html2md: helloworld 开发者社区开源的一个轻量级，强大的 html 一键转 md 工具，支持多平台文章一键转换，并保存下载到本地。](https://github.com/helloworld-Co/html2md)

**官网地址：**[helloworld - 同一个世界，同一行代码](https://www.helloworld.net/html2md)

## 部署过程

### 1.安装node

**版本为12.18.2**

**node地址：**[Node.js (nodejs.org)](https://nodejs.org/zh-cn/)

**npm设置为淘宝源：**

```bash
npm config set registry https://registry.npm.taobao.org

npm config get registry //查看是否设置成功
```

### 2. git克隆

```bash
git clone https://github.com/helloworld-Co/html2md.git
```

### 3. 安装运行

**npm权限错误：**

```bash
npm install --unsafe-perm=true --allow-root
```

```bash
npm install
npm run dev
```

**之后便可在3031端口查看了**
