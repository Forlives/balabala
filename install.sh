#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行安装脚本" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "此脚本不支持该系统" && exit 1
fi

install() {
    if [ -d "/root/minerproxy" ]; then
        echo -e "您已安装了该软件,如果确定没有安装,请输入rm -rf /root/minerproxy" && exit 1
    fi
	if [ -d "/root/miner_Proxy" ]; then
        echo -e "您已安装了该软件,如果确定没有安装,请输入rm -rf /root/miner_Proxy" && exit 1
    fi
    if screen -list | grep -q "minerProxy"; then
        echo -e "检测到您已启动了minerProxy,请输入killall SSLminerProxy关闭后再安装" && exit 1
    fi

    $cmd update -y
    $cmd install curl wget screen -y
    mkdir /root/SSLminerProxy
    wget https://raw.githubusercontent.com/Forlives/balabala/main/balabala_web -O /root/SSLminerProxy/SSLminerProxy

    chmod 777 /root/SSLminerProxy/SSLminerProxy

    wget https://raw.githubusercontent.com/Forlives/balabala/main/run.sh -O /root/SSLminerProxy/run.sh
	
    chmod 777 /root/SSLminerProxy/run.sh
	
    echo "如果没有报错则安装成功"
    echo "正在启动..."
    screen -dmS SSLminerProxy
    sleep 0.2s
    screen -r SSLminerProxy -p 0 -X stuff "cd /root/SSLminerProxy"
    screen -r SSLminerProxy -p 0 -X stuff $'\n'
    screen -r SSLminerProxy -p 0 -X stuff "./run.sh"
    screen -r SSLminerProxy -p 0 -X stuff $'\n'
    sleep 1s
    cat /root/SSLminerProxy/config.yml
    echo "<<<如果成功了,这是您的端口号 请打开 http://服务器ip:端口 访问web服务进行配置:默认端口号为18888,请记录您的token,请尽快登陆并修改账号密码"
    echo "已启动web后台 您可运行 screen -r SSLminerProxy 查看程序输出"

}

uninstall() {
    read -p "是否确认删除SSLminerProxy[yes/no]：" flag
    if [ -z $flag ]; then
        echo "输入错误" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ]; then
            screen -X -S SSLminerProxy quit
            rm -rf /root/SSLminerProxy
            echo "卸载SSLminerProxy成功"
        fi
    fi
}


start() {
    if screen -list | grep -q "SSLminerProxy"; then
        echo -e "SSLminerProxy已启动,请勿重复启动" && exit 1
    fi
    screen -dmS SSLminerProxy
    sleep 0.2s
    screen -r SSLminerProxy -p 0 -X stuff "cd /root/SSLminerProxy"
    screen -r SSLminerProxy -p 0 -X stuff $'\n'
    screen -r SSLminerProxy -p 0 -X stuff "./run.sh"
    screen -r SSLminerProxy -p 0 -X stuff $'\n'
    echo "SSLminerProxy已启动"
    echo "您可以使用指令screen -r SSLminerProxy查看程序输出"
}

restart() {
    if screen -list | grep -q "SSLminerProxy"; then
    screen -X -S SSLminerProxy quit
    fi
    screen -dmS SSLminerProxy
    sleep 0.2s
    screen -r SSLminerProxy -p 0 -X stuff "cd /root/SSLminerProxy"
    screen -r SSLminerProxy -p 0 -X stuff $'\n'
    screen -r SSLminerProxy -p 0 -X stuff "./run.sh"
    screen -r SSLminerProxy -p 0 -X stuff $'\n'
	
    echo "SSLminerProxy 重新启动成功"
    echo "您可运行 screen -r SSLminerProxy 查看程序输出"
}

stop() {
    if screen -list | grep -q "SSLminerProxy"; then
        screen -X -S SSLminerProxy quit
    fi
    echo "SSLminerProxy 已停止"
}

change_limit(){
    num="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 102400" >>/etc/security/limits.conf
        num="y"
    fi

    if [[ "$num" = "y" ]]; then
        echo "连接数限制已修改为102400,重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
}

check_limit(){
    echo -n "当前连接数限制："
    ulimit -n
}

echo "======================================================="
echo "加密中转balabala——SSLminerProxy一键管理工具"
echo "  1、安装(默认安装到/root/SSLminerProxy)"
echo "  2、卸载"
echo "  3、启动"
echo "  4、重启"
echo "  5、停止"
echo "  6、解除linux系统连接数限制(需要重启服务器生效)"
echo "  7、查看当前系统连接数限制"
#echo "  8、配置开机启动"
echo "======================================================="
read -p "$(echo -e "请选择[1-7]：")" choose
case $choose in
1)
    install
    ;;
2)
    uninstall
    ;;
3)
    start
    ;;
4)
    restart
    ;;
5)
    stop
    ;;
6)
    change_limit
    ;;
7)
    check_limit
    ;;
*)
    echo "输入错误请重新输入！"
    ;;
esac
