# 用root登录wsl
wsl.exe --distribution Alpine --user root

adduser gjr#新建用户
passwd gjr#修改密码
echo 'gjr ALL=(ALL) ALL' >> /etc/sudoers.d/sudo

# 增加profile
echo '
# 语言编码
LANG=zh_CN.UTF-8
# 路径显示
export PS1="\h:\u[\w]\$ "

# 简称
alias ls="ls --color=auto -AF"
alias ll="ls --color=auto -AFl"
' >> /etc/profile.d/init.sh

source /etc/profile

# apk修改源并更新
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
apk update
apk add curl

# apk add sudo
# echo '%sudo ALL=(ALL) ALL' >> /etc/sudoers.d/sudo
# addgroup sudo
# usermod -aG sudo gjr

# apk add openssh-server
# echo '
# PermitRootLogin yes
# ' >> /etc/ssh/sshd_config
# rc-update add sshd
