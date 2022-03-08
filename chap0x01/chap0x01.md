# 1.调查并记录实验环境的如下信息

使用**Debian9**，**Ubuntu20.04**，**OpenWrt**进行试验,其中Debian是自己的VPS，所以选择打马赛克。



- ### 1.1当前 Linux 发行版基本信息


- 使用`lsb_release`命令:

![lsb_release](./img/lsb_release.png)

![](./img/debian_lsb_release.png)

- 使用`cat /etc/*release*`查看etc目录中包含release字段的文件:

  ![](./img/lsb_release.png)

![](./img/debian_cat_release.png)

- 使用`cat /etc/issue`查看:

![cat_issue](./img/cat_issue.png)

![debian_cat_issue](./img/debian_cat_issue.png)



- 测试发现我使用的这款OpenWrt默认未安装lsblk,且不存在issue文件:

![openwrt](./img/openwrt_release.png)

### 1.2当前 Linux 内核版本信息

使用`hostnamectl | grep -i kernel`命令查看内核信息:

- Ubuntu:![ubuntukernel](./img/kernel.png)
- Debian:![debiankernel](./img/debian_kernel.png)
- OpenWrt:OpenWrt未安装`hostnamectl`,因此改用`uname -srm`:![openwrtkernel](./img/openwrt_kernel.png)



# 2.Virtualbox 安装完 Ubuntu 之后新添加的网卡如何实现系统开机自动启用和自动获取 IP？

- 在Virtualbox中添加两块网卡:

  ![ni1](./img/network_interface1.png)

![ni2](./img/network_interface2.png)

- 配置在`netplan`下的yaml文件,将两块网卡的`DHCP`功能打开，即把dhcp参数设置为`true`:

![netplan](./img/netplan.png)



# 3.如何使用 scp 在「虚拟机和宿主机之间」、「本机和远程 Linux 系统之间」传输文件？

- **虚拟机和宿主机之间**:
  - 在虚拟机中创建文件:![create](./img/create_file.png)
  - 在宿主机中使用`scp -r lsj@192.168.56.103:/home/lsj/test-dir ./`命令将文件传输到本地:![scp](./img/scp.png)
  - 确认传输成功:![file](./img/testfile.png)

- **本机和远程 Linux 系统之间**:
  - 在本地通过scp命令上传文件，因自己的vps没有设置通过口令登录的选项，故需添加参数`-i /你的私钥路径 `才能使用私钥登录:![upload](./img/upload.png)
  - 确认传输成功:![upload_correct](./img/upload_correct.png)



# 4.如何配置 SSH 免密登录？

- 在本地客户端使用ssh-keygen命令生成密钥:![keygen](./img/keygen.png)

- 将生成的.pub公钥文件写入服务器~/.ssh/authorized_keys中:![](./img/authorized_keys.png)
- 使用`$ chmod 644 ~/.ssh/authorized_keys将`authorized_keys文件的权限设为644，即只有文件所有者才能写。如果权限设置不对，SSH 服务器可能会拒绝读取该文件。

- 使用 `ssh-add`命令将刚才生成的私钥设置为默认私钥，或在**Xshell**、**PuTTY**等SSH客户端中导入私钥:![set](./img/set_privatekey.png)

- 免密登录成功:![done](./img/done.png)
- 也可通过使用 `ssh-copy-id -i key_file user@host`自动上传公钥



# 5.实验问题

- 在配置免密登录的环节中发现自己安装的Ubuntu还没有登陆过root用户，固找不到.ssh目录，之后通过命令 `ssh localhost`解决。



# 6.参考资料

[《SSH 入门教程》发布了- 阮一峰的网络日志](https://wangdoc.com/ssh/index.html)

[OpenSSH](https://www.openssh.com/)

