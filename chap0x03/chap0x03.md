# 1 实验环境

- **Ubuntu 20.04.4 LTS (Focal Fossa)**

- **VirtualBox 6.1.28**

------

# 2 Systemd命令入门

### 2.1 systemctl

`systemctl`是 Systemd 的主命令，用于管理系统。

> ```bash
> # 重启系统
> $ sudo systemctl reboot
> 
> # 关闭系统，切断电源
> $ sudo systemctl poweroff
> 
> # CPU停止工作
> $ sudo systemctl halt
> 
> # 暂停系统
> $ sudo systemctl suspend
> 
> # 让系统进入冬眠状态
> $ sudo systemctl hibernate
> 
> # 让系统进入交互式休眠状态
> $ sudo systemctl hybrid-sleep
> 
> # 启动进入救援状态（单用户状态）
> $ sudo systemctl rescue
> ```

### 2.2 systemd-analyze

`systemd-analyze`命令用于查看启动耗时。

> ```bash
> # 查看启动耗时
> $ systemd-analyze                                                                                       
> 
> # 查看每个服务的启动耗时
> $ systemd-analyze blame
> 
> # 显示瀑布状的启动过程流
> $ systemd-analyze critical-chain
> 
> # 显示指定服务的启动流
> $ systemd-analyze critical-chain atd.service
> ```

### 2.3 hostnamectl

`hostnamectl`命令用于查看当前主机的信息。

> ```bash
> # 显示当前主机的信息
> $ hostnamectl
> 
> # 设置主机名。
> $ sudo hostnamectl set-hostname rhel7
> ```

### 2.4 localectl

`localectl`命令用于查看本地化设置。

> ```bash
> # 查看本地化设置
> $ localectl
> 
> # 设置本地化参数。
> $ sudo localectl set-locale LANG=en_GB.utf8
> $ sudo localectl set-keymap en_GB
> ```

### 2.5 timedatectl

`timedatectl`命令用于查看当前时区设置。

> ```bash
> # 查看当前时区设置
> $ timedatectl
> 
> # 显示所有可用的时区
> $ timedatectl list-timezones                                                                                   
> 
> # 设置当前时区
> $ sudo timedatectl set-timezone America/New_York
> $ sudo timedatectl set-time YYYY-MM-DD
> $ sudo timedatectl set-time HH:MM:SS
> ```

### 2.6 loginctl

`loginctl`命令用于查看当前登录的用户。

> ```bash
> # 列出当前session
> $ loginctl list-sessions
> 
> # 列出当前登录用户
> $ loginctl list-users
> 
> # 列出显示指定用户的信息
> $ loginctl show-user lsj
> ```

### 2.7 测试

| systemd-analyze                                              | hostnamectl/localectl/timedatectl/loginctl                   |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [![asciicast](https://asciinema.org/a/eI3aQSYrqsEBwvqH9wbQJe7Xu.svg)](https://asciinema.org/a/eI3aQSYrqsEBwvqH9wbQJe7Xu) | [![asciicast](https://asciinema.org/a/kVTNJMLOiWs96sKqG6wfULyos.svg)](https://asciinema.org/a/kVTNJMLOiWs96sKqG6wfULyos) |

------

# 3 Systemd动手实战

### 3.1 启动服务

- 以**nginx**服务为例

| 演示                                                         | 命令                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [![asciicast](https://asciinema.org/a/BUvsdWbrHiiihCYbvdcRf95BZ.svg)](https://asciinema.org/a/BUvsdWbrHiiihCYbvdcRf95BZ) | `sudo systemctl enable nginx`        `sudo systemctl start nginx`                    `sudo systemctl status nginx` |

### 3.2 停止服务

| 演示                                                         | 命令                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [![asciicast](https://asciinema.org/a/YM8bo5ep6vnqxbtCQUJynKmHS.svg)](https://asciinema.org/a/YM8bo5ep6vnqxbtCQUJynKmHS) | `sudo systemctl status nginx`                                                   `sudo systemctl stop nginx`                                                                 `sudo systemctl kill nginx`                                                                 `sudo systemctl restart nginx` |

### 3.3 读懂配置文件

| ssh配置文件                 | 解释                                                         |
| --------------------------- | ------------------------------------------------------------ |
| ![config](./img/config.png) | 红色区块为[Unit] 区块：启动顺序与依赖关系；绿色区块[Service] 区块：启动行为；黄色区块为[Install] 区块，定义如何安装这个配置文件 |



### 3.4 动手写配置文件

```ini
[Unit]
Description=Lsj's Systemd Service

[Service]
EnvironmentFile=-/home/lsj/helloworld
ExecStart=/usr/bin/echo $WORD

[Install]
WantedBy=multi-user.target
```

| 演示                                                         | 命令                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [![asciicast](https://asciinema.org/a/O7gtRsm1Ucw7xnje8lvfp85J2.svg)](https://asciinema.org/a/O7gtRsm1Ucw7xnje8lvfp85J2) | `vim /usr/lib/systemd/system/helloworld.service`        `systemctl enable helloworld`                                      `systemctl start helloworld`                                              `systemctl status helloworld` |

