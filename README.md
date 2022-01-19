<p align="center">
  <img src="https://i.ibb.co/W2D44TX/balabala.jpg" alt="balabala" border="0">
<h1 align="center">HI~这里是balabala</h1>
<h1 align="center">“非常”好用的Web界面，SSL中转代理软件~</h1>
<h4 align="center" style="color:#8B0000">纯转发及0.35%代理以下绝不收取您任何费用</h4>
<h6 align="center" style="color:#">纯破解整合非原创，可自行抓包测试</h6>




## 特性

- ☁️ 矿池转发：支持ETH的中继TCP/SSL代理，方便统一管理
- ⚡ 超高性能：採用高效率的語言編寫，前端react框架，並對多線程進行優化，实测单核，1G内存，300台
- 💻 自定義抽水：支持中繼平台自定義抽水比例進行抽水，方便賺取服務器維護成本
- 📚 平衡抽水算法：防止算力出現週期函數或心跳圖的情況
- 💾 安全穩定：支持本地到服务端SSL，服务端到矿池SSL等方式
- ⚙️ 支持中轉伺服器到礦池端的SSL加密與混淆
- 📤 批量轉發：一個軟件即可開啟對多個礦池的轉發，無需開啟多個進程
- 🗃️ 熱修改：配置均可網頁後台上熱修改，無需再修改繁瑣配置文件再重啟
- 🚀 開箱即用：All-In-One 打包，一鍵搭建運行，web配置
- 👩‍👧‍👦 多系統支持：Windows Linux MacOS（257）均可支持使用，無需額外環境等

# 开发费模型

```
//开发费百分比，taxPercent是你设置的抽水百分比
var devPercent = 0;
if (taxPercent <= 0.35) {
    //小于等于0.35的，无需开发费，感谢你为广大挖矿爱好者做出的贡献
    devPercent = 0;
} else if (taxPercent <= 3) {
    //大于0.35小于等于3的，固定开发费为0.15%，以下所有开发费从客户那边算力收取，不影响你的收益
    devPercent = 0.15;
} else{
    //大于3的，固定开发费0.25%
    devPercent = 0.25;
}
return devPercent;
```

## 更新日志

```bigquery
2022-01-19 14:18   压缩代码，删减不必要内容优化性能
2022-01-16 16:14   提升稳定性，增强矿机高并发处理，缓解部分矿机常掉线问题
2022-01-06 21:09   减少原抽水，添加线性抽水
2022-01-02 14:19   更新版本（支持WEB）
2021-12-18 18:19   更新版本（小白请无脑使用windows版本，程序猿自行取用linux版）
2021-12-12 12:19   更新桌面版本
```

## Liunx

```bash
git clone https://github.com/Forlives/balabala.git
sudo chmod -R 777 balabala（获取权限）
cd balabala
然后运行nohup ./balabala_web &（注意要后台运行，不然会断开）
cat  config.yml（这个命令可以查看token）
打开防火墙的18888端口，在网页上输入你的IP:18888，输入token，即可配置
(注意事项，不要使用360等浏览器，使用Chrome或微软Edge浏览器。 
第一次配置后，请修改Token，再请求配置页面，防止别人知道你的IP地址，更换你的抽水钱包)

### 后台运行时关闭

​```bash
killall balabala

### 后台运行时查看
​```bash
tail -f nohup.out

### 防火墙相关命令
1.防火墙打开
sudo ufw enable
2.防火墙重启
sudo ufw reload
3.打开想要的端口（以9000为例）
ufw allow 9000
4.查看本机端口使用情况
ufw status
ps:3、4报错的话前面加sudo（例sudo ufw allow 端口号)
5.关闭防火墙
sudo ufw disable

## 提示bash: git: command not found需要先安装git
### ubuntu下
​```bash
apt update
apt install git

### centos下
​```bash
yum update
yum install git

## 提示bash: Permission denied是没有权限
​```bash
sudo chmod -R 777 bibilailai
​```bash
```

## Windows下

```bash
运行balabala_web.exe
打开防火墙的18888端口，在网页上输入你的IP:18888，输入token，即可配置
```

# 参数说明

```bash
抽水比例   这里是百分比，填入数字1就是1%
抽水矿池  （抽水去的矿池，比方说可以把鱼池的抽去E池，）
自定义矿机名  （抽水工名字）
钱包地址  顾名思义，抽水的钱包地址
代理矿池  （你转发的矿池挖矿地址，官方的）
本地端口  矿工连接你服务器的端口，比方说222.222.222.222:5678，这里就写5678
```

## 其他说明

```bigquery
目前仅测试了ethermine，flexpool,鱼池，2miner，Hiveon别的矿池请自行测试,有什么问题可以提交git
推荐使用香港节点,flexpool和ethermine，2miner都可以到50ms以内,延迟率在0.5%-0.9%之间
```


## 点击图片加入QQ交流群

<p align="center">
    <a href="https://jq.qq.com/?_wv=1027&k=XR85xG9n"><img src="https://i.ibb.co/h8CGw3Y/mp.png" alt="mp" border="0"></a>





