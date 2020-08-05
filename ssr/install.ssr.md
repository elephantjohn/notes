compile shadowsocks-qt5

***before build\***:

```
make sure the directory 'build' is empty, or the old files will make the process failed.
```

***when compile shadowsocks-qt5\***:

***build in master branch ,rather than trunk branch.\***

errors shows as lack of Botan2 .

so,do:

```bash
wget https://botan.randombit.net/releases/Botan-2.3.0.tgz
tar xvf Botan-2.3.0.tgz
cd Botan-2.3.0
./configure.py
make -j4
sudo make install
sudo ldconfig
```

dont forget to do:

```
sudo apt-get install cmake qtbase5-dev libqrencode-dev libzbar0 libappindicator1 libzbar-dev
```

### see refer:

```bash
https://www.shangyexin.com/2018/04/20/shadowsocks-qt5/
```

the content in the refer webpage are as follows:

>
>
>### 									[尚叶鑫的个人主页](https://www.shangyexin.com/) 							
>
>Just do IT
>
>​		 	
>
>​							
>
>​															
>
>- [主页](https://www.shangyexin.com/)
>- [博客](https://www.shangyexin.com/blog/)
>- [Nextcloud](https://www.shangyexin.com/nextcloud/)
>- [Gogs](https://www.shangyexin.com/gogs/)
>- [关于我](https://www.shangyexin.com/about/)
>
># ubuntu16.04安装shadowsocks-qt5并支持chacha20-ietf-poly1305协议
>
>**背景：** 在ubuntu16.04的机器上需要使用shadowsocks-qt5，但是购买的服务器用的是chacha20-ietf-poly1305协议，采用apt-get安装的shadowsocks-qt5都是没有该协议的。
>
>**解决方法：**  采用源码安装
>
>**步骤：**
>
>#### 1.下载shadowsocks-qt5源码并安装相关依赖
>
>**下载源码：**
>
>```bash
>git clone https://github.com/shadowsocks/shadowsocks-qt5
>```
>
>Bash
>
>Copy
>
>**编译指南：** https://github.com/shadowsocks/shadowsocks-qt5/wiki/Compiling
>
>**这贴一下编译指南：**
>
>>   Make sure you’ve installed all dependent development packages (with -dev or -devel).
>>
>> - cmake >= 3.1.0
>> - qt5-qtbase-gui >= 5.2 (qtbase5 in Debian/Ubuntu)
>>     qrencode (libqrencode in Debian/Ubuntu)
>> - libQtShadowsocks >= 1.10.0 (libqtshadowsocks in Debian/Ubuntu. DON’T use the trunk code)
>> - zbar (libzbar0 in Debian/Ubuntu)
>> - libappindicator (libappindicator1 in Debian/Ubuntu)
>> - Check libQtShadowsocks Compiling wiki if you need to build it yourself.
>
>也就是说在编译前需要安装上面对应的库与工具
> 我们按照说明进行安装：
>
>```bash
>sudo apt-get install cmake qtbase5-dev libqrencode-dev libzbar0 libappindicator1 libzbar-dev
>```
>
>Bash
>
>Copy
>
>这时候你会发现其中libqtshadowsocks库没有，因为这个也需要我们手动编译并安装
>
>#### 2.下载libqtshadowsocks源码
>
>**下载源码：**
>
>```bash
>git clone https://github.com/shadowsocks/libQtShadowsocks 
>```
>
>Bash
>
>Copy
>
>**编译指南：** https://github.com/shadowsocks/libQtShadowsocks/wiki/Compiling
>
>继续贴编译指南：
>
>> - Qt >= 5.5
>> - Botan-2 >= 2.3.0
>> - Or Botan-1.10 (Not recommended)
>> - CMake >= 3.1
>> - A C++ Compiler that supports C++14 features (i.e. GCC >= 4.9)
>
>**编译方法：**
>
>```bash
>mkdir build && cd build
>cmake .. -DUSE_BOTAN2=ON
>make -j4
>sudo make install
>```
>
>Bash
>
>Copy
>
>注意这里一定要加 **-DUSE_BOTAN2=ON**
> 不然编译出来没有chacha20-ietf-poly1305
> 但是这时候你又会发现系统里面并没有Botan-2，那怎么办呢？
> 答案当然是—–自己编译（手动滑稽
>
>#### 3.下载Botan2.3.0源码并编译
>
>```bash
>wget https://botan.randombit.net/releases/Botan-2.3.0.tgz
>tar xvf Botan-2.3.0.tgz
>cd Botan-2.3.0
>./configure.py
>make -j4
>sudo make install
>sudo ldconfig
>```
>
>Bash
>
>Copy
>
>当完成Botan2.3.0的编译与安装后
> 执行步骤2中的libqtshadowsocks的编译
>
>#### 4. 编译shadowsocks-qt5
>
>```bash
>mkdir build && cd build
>cmake .. 
>make -j4
>sudo make install
>```
>
>Bash
>
>Copy
>
>#### 5. Enjoy
>
>终端输入
>
>```
>ss-qt5 
>```
>
>启动shadowsocks-qt5，这时候你会发现已经支持chacha20-ietf-poly1305协议了，至此全部流程完成。