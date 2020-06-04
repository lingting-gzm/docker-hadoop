# docker-hadoop
这个 Dockerfile 出现的目的，是我想要一个贴合原版的hadoop容器
# 注释
```
ADD hadoop /opt/hadoop
```
> hadoop 是一个文件夹， 里面存放的是 从 https://hadoop.apache.org/releases.html 中下载的 hadoop包解压后的文件

# demo
> demo 文件夹下存放的 使用 docker-compose 构筑的示例
> 它由一个 namenode 和一个 datanode 组成
>
# demo2
> demo2 文件存放的是 多datanode节点的示例
