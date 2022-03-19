# 1.软件包管理

|                                        | Debian9                                                      | Ubuntu20.04                                                  | 命令                                                         |
| -------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 安装 `tmux` 和 `tshark`                | [![asciicast](https://asciinema.org/a/JdtOpZL2GGr4YMAoT0ohL4kHT.svg)](https://asciinema.org/a/JdtOpZL2GGr4YMAoT0ohL4kHT) | [![asciicast](https://asciinema.org/a/kfQrnKn0Pp5Jkh3mvwA4KZxeJ.svg)](https://asciinema.org/a/kfQrnKn0Pp5Jkh3mvwA4KZxeJ) | ` sudo apt install tmux && sudo apt install tshark  `        |
| 查看安装路径                           | [![asciicast](https://asciinema.org/a/kGGJzh7BxZcBCLTOvjFLzi6F0.svg)](https://asciinema.org/a/kGGJzh7BxZcBCLTOvjFLzi6F0) | [![asciicast](https://asciinema.org/a/E0CiPAomFoNGSwmDgqoRehUUn.svg)](https://asciinema.org/a/E0CiPAomFoNGSwmDgqoRehUUn) | `whereis tmux `                                              |
| 卸载 `tshark` ，验证 `tshark` 卸载结果 | [![asciicast](https://asciinema.org/a/9eZCz9FS0m6z2W5JMzb8qfbfs.svg)](https://asciinema.org/a/9eZCz9FS0m6z2W5JMzb8qfbfs) | [![asciicast](https://asciinema.org/a/0EnHb2EwkouWMrOk1JcnszoO6.svg)](https://asciinema.org/a/0EnHb2EwkouWMrOk1JcnszoO6) | `apt --install | grep tshark`   `dpkg -L | grep tshark`                                                 `sudo apt remove tshark` |



# 2.文件管理

|                                                              | Debian9                                                      | Ubuntu20.04                                                  | 命令                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 找到 `/tmp` 目录及其所有子目录下，文件名包含 `666` 的所有文件 | [![asciicast](https://asciinema.org/a/r9ZTmEsATSVaIbXkXNSICzyCQ.svg)](https://asciinema.org/a/r9ZTmEsATSVaIbXkXNSICzyCQ) | [![asciicast](https://asciinema.org/a/A6ikgBJvTf5RmZ3VRBvGNZT4J.svg)](https://asciinema.org/a/A6ikgBJvTf5RmZ3VRBvGNZT4J) | `find -name "*666*"`                                         |
| 找到 `/tmp` 目录及其所有子目录下，文件内容包含 `666` 的所有文件 | [![asciicast](https://asciinema.org/a/rDk1QEcKV6Z7PWC8FYHAy9X9Q.svg)](https://asciinema.org/a/rDk1QEcKV6Z7PWC8FYHAy9X9Q) | [![asciicast](https://asciinema.org/a/36FAFDdJ51UCOeFvUmnLRcGYR.svg)](https://asciinema.org/a/36FAFDdJ51UCOeFvUmnLRcGYR) | `sudo grep -r --exclude='*.cast' "666"  `  `sudo grep -r  "666"  ` |



# 3.文件压缩与解压缩

|                                                              | Debian9                                                      | Ubuntu                                                       | 命令                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 练习课件中 文件压缩与解压缩 一节所有提到的压缩与解压缩命令的使用方法 | [![asciicast](https://asciinema.org/a/EJKtFoqirCWwRhISZGmixkz8A.svg)](https://asciinema.org/a/EJKtFoqirCWwRhISZGmixkz8A) | [![asciicast](https://asciinema.org/a/C3m3qodg2j0kabSc10jleVD2n.svg)](https://asciinema.org/a/C3m3qodg2j0kabSc10jleVD2n) | `unzip -O cp936  test.zip   `                                      `unar test.zip  ` |



# 4.子进程管理实验

|                                | Debian9                                                      |
| ------------------------------ | ------------------------------------------------------------ |
| 控制进程的开启、关闭、后台挂起 | [![asciicast](https://asciinema.org/a/t5hzKEmGsbgzWqIJ8tpV0yYRM.svg)](https://asciinema.org/a/t5hzKEmGsbgzWqIJ8tpV0yYRM) |



# 5.目标系统的 CPU、内存大小、硬盘数量与硬盘容量

|                                              | Debian9                                                      | Ubuntu20.04                                                  | 命令                                                         |
| -------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 目标系统的 CPU、内存大小、硬盘数量与硬盘容量 | [![asciicast](https://asciinema.org/a/NzuVMCGOZ0kJaCcBkC01FhuLV.svg)](https://asciinema.org/a/NzuVMCGOZ0kJaCcBkC01FhuLV) | [![asciicast](https://asciinema.org/a/rF0z3UY5uHfI3S2oICFnwnXxM.svg)](https://asciinema.org/a/rF0z3UY5uHfI3S2oICFnwnXxM) | `cat /proc/cpuinfo | grep 'process' | sort | uniq | wc -l`                                                                                                         `cat /proc/meminfo`                                                                                                                                                                                                   `df -hl` |



# 6.实验问题

### 1.

- 在第二个实验中，我的Ubuntu20.04下，使用asciinema录制，会在当前目录下生成一个后缀名为`.cast`的录制临时文件，在使用`sudo grep -r  "666"`会导致这个录制零食文件也参与到查找中来，影响了实验结果，如下：

- [![asciicast](https://asciinema.org/a/fLZIgqEsKXz9X0nZpT3PcVsK9.svg)](https://asciinema.org/a/fLZIgqEsKXz9X0nZpT3PcVsK9)

- 解决方法：将`.cast`排除查询，使用`sudo grep -r --exclude='*.cast' "666"`  
- 使用Debian9进行实验时没有出现这种情况，目前没有查明造成这种差异的原因。

### 2.

- 在解压实验中，Debian9中的unzip没有-O参数，所以此处选择了`unar`进行解压



# 7.参考资料

- [Use grep --exclude/--include syntax to not grep through certain files](https://stackoverflow.com/questions/221921/use-grep-exclude-include-syntax-to-not-grep-through-certain-files)

- [Linux 下 zip 文件解压乱码如何解决？](https://www.zhihu.com/question/20523036)

