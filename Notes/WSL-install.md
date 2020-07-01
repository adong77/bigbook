## Ubuntu 20.04 LTS 更换阿里云源

1. 先备份原始源文件：
`sudo cp /etc/apt/source.list /etc/apt/source.list.backup`

2. 修改文件:   
`vim  /etc/apt/source.list`

3. 清除原有的内容，替换为aliyun源:
```
deb http://mirrors.aliyun.com/ubuntu/ focal main restricted
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted
deb http://mirrors.aliyun.com/ubuntu/ focal universe
deb http://mirrors.aliyun.com/ubuntu/ focal-updates universe
deb http://mirrors.aliyun.com/ubuntu/ focal multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted
deb http://mirrors.aliyun.com/ubuntu/ focal-security universe
deb http://mirrors.aliyun.com/ubuntu/ focal-security multiverse
```
4. 保存，并执行更新：
```
sudo  apt update
sudo  apt upgrade
```