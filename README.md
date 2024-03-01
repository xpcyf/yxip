搬砖
VPS自动优选IP
1.安装WARP
```
bash <(curl -Ls https://raw.githubusercontent.com/xpcyf/cf/main/CF.sh)
```
2.安装JQ
```
apt update
```
```
apt install -y jq
```
3.进入优选文件目录/root/auto
```
cd auto
```
4.给予CloudflareST文件权限
```
chmod +x CloudflareST
```
5.运行IP优选
```
bash ip.sh
```
或跳过2345
```
bash <(curl -Ls https://raw.githubusercontent.com/xpcyf/cf/main/youxuan.sh)
```
进入定时任务保存定时运行自动优选IP
```
crontab -e
```
1小时运行一次优选IP
```
*/60 * * * * cd /root/auto/ && bash ip.sh
```
