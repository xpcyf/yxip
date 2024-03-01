VPS自动优选IP
```
bash <(curl -Ls https://raw.githubusercontent.com/xpcyf/cf/main/CF.sh)
```
安装JQ
```
apt update
```
```
apt install -y jq
```
1.进入优选文件目录/root/auto
```
cd auto
```
2.给予CloudflareST文件权限
```
chmod +x CloudflareST
```
3.运行IP优选
```
bash ip.sh
```
或跳过123
```
bash <(curl -Ls https://raw.githubusercontent.com/xpcyf/cf/main/youxuan.sh)
```
