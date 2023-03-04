---
date: 2022-11-19 23:53:33
title: as
type: as
updated: Sat, 04 Mar 2023 05:57:26 GMT
---
<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /


<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>倒计时</title>
    <script language="javascript" type="text/javascript">
        var interval = 1000;
        function ShowCountDown(year, month, day, divname) {
            var now = new Date();
            var endDate = new Date(year, month - 1, day);
            var leftTime = endDate.getTime() - now.getTime();
            var leftsecond = parseInt(leftTime / 1000);
            //var day1=parseInt(leftsecond/(24*60*60*6));
            var day1 = Math.floor(leftsecond / (60 * 60 * 24));
            var hour = Math.floor((leftsecond - day1 * 24 * 60 * 60) / 3600);
            var minute = Math.floor((leftsecond - day1 * 24 * 60 * 60 - hour * 3600) / 60);
            var second = Math.floor(leftsecond - day1 * 24 * 60 * 60 - hour * 3600 - minute * 60);
            var cc = document.getElementById(divname);
            cc.innerHTML = "距离" + year + "年" + month + "月" + day + "日还有：" + day1 + "天" + hour + "小时" + minute + "分" + second + "秒";
        }
        window.setInterval(function () { ShowCountDown(2023, 3, 10, 'divdown1'); }, interval);
    </script>
</head>
</html>

|  |   |  |
| --- | --- | --- |
|  |  |  |
|  |  |  |


