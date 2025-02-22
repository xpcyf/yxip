#!/bin/bash
##版本：V2.1.1
	#新功能，支持更新优选完毕后推送至TG，再也不怕脚本没有成功运行了。
	#使用脚本需要安装jq和timeout，新增openwrt专用cf_RE.sh文件，运行cf_RE.sh即可在openwrt安装jq和timeout两个扩展。
	#其他linux请自行安装jq和timeout。

###################################################################################################
##运行模式ipv4 or ipv6 默认为：ipv4
#指定工作模式为ipv4还是ipv6。如果为ipv6，请在文件夹下添加ipv6.txt
#ipv6.txt在CloudflareST工具包里，下载地址：https://github.com/XIU2/CloudflareSpeedTest/releases
IP_ADDR=ipv4
###################################################################################################
##cloudflare配置
#cloudflare账号邮箱
x_email=xxxxxxxxx@gmail.com
#填写需要DDNS的完整域名
#支持多域名:域名需要填写在括号中，每个域名之间用“空格”相隔。
#例如：（cdn.test.com） 或者 （cdn1.test.com cdn2.test.com cdn3.test.com）
hostname=(yx.xxxx.top yx1.xxxx.top yx2.xxxx.top yx3.xxxx.top yx4.xxxx.top)
#空间ID
zone_id=54xxxxxxxxx675c
#Global API Key
api_key=8acxxxxxxxxxxxxx473
###################################################################################################
##openwrt科学上网插件配置
#优选节点时是否自动停止科学上网服务 true=自动停止 false=不停止 默认为 true
pause=true
#填写openwrt使用的是哪个科学上网客户端，填写对应的“数字”  默认为 1  客户端为passwall
# 1=passwall 2=passwall2 3=ShadowSocksR Plus+ 4=clash 5=openclash 6=bypass
clien=1
###################################################################################################
##CloudflareST配置
#测速地址  
CFST_URL=cesu2.xxxxxxx.top
#测速线程数量；越多测速越快，性能弱的设备 (如路由器) 请勿太高；(默认 200 最多 1000 )
CFST_N=200
#延迟测速次数；单个 IP 延迟测速次数，为 1 时将过滤丢包的IP，TCP协议；(默认 4 次 )
CFST_T=1
#下载测速数量；延迟测速并排序后，从最低延迟起下载测速的数量；(默认 10 个)
CFST_DN=10
#平均延迟上限；只输出低于指定平均延迟的 IP，可与其他上限/下限搭配；(默认9999 ms 这里推荐配置250 ms)
CFST_TL=250
#平均延迟下限；只输出高于指定平均延迟的 IP，可与其他上限/下限搭配、过滤假墙 IP；(默认 0 ms 这里推荐配置40)
CFST_TLL=40
#下载速度下限；只输出高于指定下载速度的 IP，凑够指定数量 [-dn] 才会停止测速；(默认 0.00 MB/s 这里推荐5.00MB/s)
CFST_SL=5
#####################################################################################################
##TG推送设置
#（填写即为开启推送，未填写则为不开启）
#TG机器人token 例如：123456789:ABCDEFG...
telegramBotToken=
#用户ID或频道、群ID 例如：123456789
telegramBotUserId=
#####################################################################################################
source cf_ddns