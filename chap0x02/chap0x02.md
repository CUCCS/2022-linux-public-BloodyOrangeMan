# 1.实验准备

- 实验环境：**Ubuntu 20.04.4 LTS (Focal Fossa)** ,**Debian 9 *Stretch***，**CentOS 7.5** 

- 注册并关联asciinema账号：

  ![asciinema](./img/pre-work-asciinema.png)

- 将解压实验中所需文件通过scp方式上传至vps：

  ![zip](./img/pre-work-zip.png)

  





# 2.软件包管理

- **本次实验中不同的Linux发行版本之间的主要差异来自于发行版间包管理命令的差异，因此重点比较三个发行版本的软件包管理命令**

| 操作                                   | Debian9                                                      | Ubuntu20.04                                                  | CentOS 7.5                                                   |
| -------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 安装 `tmux` 和 `tshark`                | [![asciicast](https://asciinema.org/a/JdtOpZL2GGr4YMAoT0ohL4kHT.svg)](https://asciinema.org/a/JdtOpZL2GGr4YMAoT0ohL4kHT) | [![asciicast](https://asciinema.org/a/kfQrnKn0Pp5Jkh3mvwA4KZxeJ.svg)](https://asciinema.org/a/kfQrnKn0Pp5Jkh3mvwA4KZxeJ) | [![asciicast](https://asciinema.org/a/kpt5dhCurFOQyfex0VRlyHeVZ.svg)](https://asciinema.org/a/kpt5dhCurFOQyfex0VRlyHeVZ) |
| 查看安装路径                           | [![asciicast](https://asciinema.org/a/kGGJzh7BxZcBCLTOvjFLzi6F0.svg)](https://asciinema.org/a/kGGJzh7BxZcBCLTOvjFLzi6F0) | [![asciicast](https://asciinema.org/a/E0CiPAomFoNGSwmDgqoRehUUn.svg)](https://asciinema.org/a/E0CiPAomFoNGSwmDgqoRehUUn) | [![asciicast](https://asciinema.org/a/quNDbWjGxtbEvTOpqgI1Rcf6S.svg)](https://asciinema.org/a/quNDbWjGxtbEvTOpqgI1Rcf6S) |
| 卸载 `tshark` ，验证 `tshark` 卸载结果 | [![asciicast](https://asciinema.org/a/9eZCz9FS0m6z2W5JMzb8qfbfs.svg)](https://asciinema.org/a/9eZCz9FS0m6z2W5JMzb8qfbfs) | [![asciicast](https://asciinema.org/a/0EnHb2EwkouWMrOk1JcnszoO6.svg)](https://asciinema.org/a/0EnHb2EwkouWMrOk1JcnszoO6) | [![asciicast](https://asciinema.org/a/vCmdH08K9zL6DzNdUeAjIc8DH.svg)](https://asciinema.org/a/vCmdH08K9zL6DzNdUeAjIc8DH) |

| 操作                                   | Debian9                                               | Ubuntu20.04                                           | CentOS 7.5                                                   |
| -------------------------------------- | ----------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------ |
| 安装 `tmux` 和 `tshark`                | ` sudo apt install tmux && sudo apt install tshark  ` | ` sudo apt install tmux && sudo apt install tshark  ` | `sudo yum install tmux && sudo yum install wireshark`        |
| 查看安装路径                           | `whereis tmux `                                       | `whereis tmux`                                        | `whereis tmux`                                               |
| 卸载 `tshark` ，验证 `tshark` 卸载结果 | <code> dpkg -L &#124; grep tshark</code>              | <code>apt --install &#124; grep tshark</code>         | <code>rpm -qal&#124; grep tshark && rpm -qal &#124;grep tmux</code> |



# 3.文件管理

| 操作                                                         | Debian9                                                      | Ubuntu20.04                                                  | 命令                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 找到 `/tmp` 目录及其所有子目录下，文件名包含 `666` 的所有文件 | [![asciicast](https://asciinema.org/a/r9ZTmEsATSVaIbXkXNSICzyCQ.svg)](https://asciinema.org/a/r9ZTmEsATSVaIbXkXNSICzyCQ) | [![asciicast](https://asciinema.org/a/A6ikgBJvTf5RmZ3VRBvGNZT4J.svg)](https://asciinema.org/a/A6ikgBJvTf5RmZ3VRBvGNZT4J) | `find -name "*666*"`                                         |
| 找到 `/tmp` 目录及其所有子目录下，文件内容包含 `666` 的所有文件 | [![asciicast](https://asciinema.org/a/rDk1QEcKV6Z7PWC8FYHAy9X9Q.svg)](https://asciinema.org/a/rDk1QEcKV6Z7PWC8FYHAy9X9Q) | [![asciicast](https://asciinema.org/a/36FAFDdJ51UCOeFvUmnLRcGYR.svg)](https://asciinema.org/a/36FAFDdJ51UCOeFvUmnLRcGYR) | `sudo grep -r --exclude='*.cast' "666"  `  `sudo grep -r  "666"  ` |



# 4.文件压缩与解压缩

| 操作                                                         | Debian9                                                      | Ubuntu                                                       | 命令                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 练习课件中 文件压缩与解压缩 一节所有提到的压缩与解压缩命令的使用方法 | [![asciicast](https://asciinema.org/a/EJKtFoqirCWwRhISZGmixkz8A.svg)](https://asciinema.org/a/EJKtFoqirCWwRhISZGmixkz8A) | [![asciicast](https://asciinema.org/a/C3m3qodg2j0kabSc10jleVD2n.svg)](https://asciinema.org/a/C3m3qodg2j0kabSc10jleVD2n) | `unzip -O cp936  test.zip   `                                      `unar test.zip  ` |

| 后缀名      | 解压/解包                                           | 压缩/打包                          |
| ----------- | --------------------------------------------------- | ---------------------------------- |
| **.tar**    | `tar xvf FileName.tar`                              | `tar cvf FileName.tar DirName`     |
| **.gz**     | `gunzip FileName.gz` `gzip -d FileName.gz`          | `gzip FileName`                    |
| **.tar.gz** | `tar zxvf FileName.tar.gz`                          | `tar zcvf FileName.tar.gz DirName` |
| **.zip**    | `unzip FileName.zip`                                | `zip FileName.zip DirName`         |
| **.rpm**    | <code>rpm2cpio FileName.rpm &#124; cpio -div</code> | /                                  |



# 5.子进程管理实验

| 操作                           | Debian9                                                      |
| ------------------------------ | ------------------------------------------------------------ |
| 控制进程的开启、关闭、后台挂起 | [![asciicast](https://asciinema.org/a/t5hzKEmGsbgzWqIJ8tpV0yYRM.svg)](https://asciinema.org/a/t5hzKEmGsbgzWqIJ8tpV0yYRM) |



# 6.目标系统的 CPU、内存大小、硬盘数量与硬盘容量

| 操作                                         | Debian9                                                      | Ubuntu20.04                                                  | 命令                                                         |
| -------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 目标系统的 CPU、内存大小、硬盘数量与硬盘容量 | [![asciicast](https://asciinema.org/a/NzuVMCGOZ0kJaCcBkC01FhuLV.svg)](https://asciinema.org/a/NzuVMCGOZ0kJaCcBkC01FhuLV) | [![asciicast](https://asciinema.org/a/rF0z3UY5uHfI3S2oICFnwnXxM.svg)](https://asciinema.org/a/rF0z3UY5uHfI3S2oICFnwnXxM) | <code>cat /proc/cpuinfo &#124; grep 'process' &#124; sort &#124; uniq &#124; wc -l   </code>                                                                                                                                                                                                                                  `cat /proc/meminfo`                                                                                                                                                                                                   `df -hl` |



# 7.实验问题

### 7.1

- 在第二个实验中，我的Ubuntu20.04下，使用asciinema录制，会在当前目录下生成一个后缀名为`.cast`的录制临时文件，在使用`sudo grep -r  "666"`会导致这个录制临时文件也参与到查找中来，影响了实验结果，如下：

- [![asciicast](https://asciinema.org/a/fLZIgqEsKXz9X0nZpT3PcVsK9.svg)](https://asciinema.org/a/fLZIgqEsKXz9X0nZpT3PcVsK9)

- 解决方法：将`.cast`排除查询，使用`sudo grep -r --exclude='*.cast' "666"`  
- 使用Debian9进行实验时没有出现这种情况，目前没有查明造成这种差异的原因。

### 7.2

- 在解压实验中，Debian9中的unzip没有-O参数，所以此处选择了`unar`进行解压



# 8.参考资料

- [Use grep --exclude/--include syntax to not grep through certain files](https://stackoverflow.com/questions/221921/use-grep-exclude-include-syntax-to-not-grep-through-certain-files)

- [Linux 下 zip 文件解压乱码如何解决？](https://www.zhihu.com/question/20523036)

