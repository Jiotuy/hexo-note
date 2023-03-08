---
abbrlink: '8183'
categories:
  - - interesting
cover: 'https://picture.noel.ga/202303071816814.jpeg'
date: '2023-03-7 13:46:00'
tags:
  - deploy
title: 部署trilium web云服务
top_img: 'https://picture.noel.ga/202303071818285.jpeg'
aplayer:
aside:
comments:
description:
highlight_shrink:
katex:
keywords:
mathjax:
type:
updated:
---

<!-- toc -->



**使用云服务器部署trilium web并利用rclone将数据同步到onedrive**

## 部署trilium

因为我使用的是中文版，所以我并没有使用官方版[GitHub - zadam/trilium: Build your personal knowledge base with Trilium Notes](https://github.com/zadam/trilium)

而是使用了 [GitHub - Nriver/trilium-translation: Translation for Trilium Notes. Trilium Notes 中文适配, 体验优化](https://github.com/Nriver/trilium-translation)

### docker启动

**docker-compose.yml**

```yaml
version: '3'
services:
  trilium-cn:
    image: nriver/trilium-cn
    restart: always
    ports:
      - "8080:8080"
    volumes:
      # 把同文件夹下的 trilium-data 目录映射到容器内
      - ./trilium-data:/root/trilium-data
    environment:
      # 环境变量表示容器内笔记数据的存储路径
      - TRILIUM_DATA_DIR=/root/trilium-data
```

```bash
docker-compose up -d
```

### nginx转发

```nginx
location / {
	    proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_pass http://localhost:8080;
        proxy_read_timeout 90;
	}

```

## rclone备份

### 配置rclone

**下载rclone**

```bash
apt install rclone
```

使用window获得token [Microsoft OneDrive (rclone.org)](https://rclone.org/onedrive/#creating-client-id-for-onedrive-personal)



获取长期token参考官方文档

[Microsoft OneDrive (rclone.org)](https://rclone.org/onedrive/#creating-client-id-for-onedrive-personal)

> To create your own Client ID, please follow these steps:
>
> 1. Open https://portal.azure.com/#blade/Microsoft_AAD_RegisteredApps/ApplicationsListBlade and then click `New registration`.
> 2. Enter a name for your app, choose account type `Accounts in any organizational directory (Any Azure AD directory - Multitenant) and personal Microsoft accounts (e.g. Skype, Xbox)`, select `Web` in `Redirect URI`, then type (do not copy and paste) `http://localhost:53682/` and click Register. Copy and keep the `Application (client) ID` under the app name for later use.
> 3. Under `manage` select `Certificates & secrets`, click `New client secret`. Enter a description (can be anything) and set `Expires` to 24 months. Copy and keep that secret *Value* for later use (you *won't* be able to see this value afterwards).
> 4. Under `manage` select `API permissions`, click `Add a permission` and select `Microsoft Graph` then select `delegated permissions`.
> 5. Search and select the following permissions: `Files.Read`, `Files.ReadWrite`, `Files.Read.All`, `Files.ReadWrite.All`, `offline_access`, `User.Read` and `Sites.Read.All` (if custom access scopes are configured, select the permissions accordingly). Once selected click `Add permissions` at the bottom.
>
> Now the application is complete. Run `rclone config` to create or edit a OneDrive remote. Supply the app ID and password as Client ID and Secret, respectively. rclone will walk you through the remaining steps.

```bash
rclone config file  #获取rclone的配置文件,上传至linux服务器
```

### 备份脚本

```shell
date1=$(date --date='6 hour ago')
date2=$(stat -c %y /var/trilium-data/document.db)

echo "当前时间为 -> $(date)" >> /var/shell/backup.log
echo "document.db修改时间为 $date2"  >> /var/shell/backup.log

t1=`date -d "$date1" +%s`
t2=`date -d "$date2" +%s`
 
if [ $t2 -gt $t1 ]; then
	echo "开始备份..." >> /var/shell/backup.log
	zip -q -r /var/shell/back_up.zip /var/trilium-data/
	rclone sync /var/shell/back_up.zip  onedrive:trilium-data/ >> /var/shell/backup.log
	echo "备份成功" >> /var/shell/backup.log
else 
	echo "无需备份" >> /var/shell/backup.log
fi
echo -e "\n" >> /var/shell/backup.log
```

使用 **crontab -e** 进行定时任务配置

```sh
0 6,12,18,24 * * * sh /var/shell/backup.sh
```

