[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/big-data-europe/Lobby)

# docker-hbase-phoenix

### Docker HBase + Phoenix 开发环境单机快速部署

<br/>

## 项目简介

基于  [**big-data-europe**](https://github.com/big-data-europe/docker-hbase)  的仓库代码修改，主要升级了 HBase 版本到 2.0.5， 增加 Phoenix 的配置，增加 HBase 对 Hadoop 共享库的配置，同时修改 HBase 组件由 http 下载为本地二进制包拷贝（天朝的墙....），减少构建过程中键盘被砸坏的风险。

主要组件版本如下：

* Hadoop-2.7.4
* Zookeeper-3.4.10
* HBase-2.0.5
* Phoenix-5.0.0

<br/>

## 使用过程

### 下载仓库

仓库中包含完整的 `hbase-2.0.5-bin.tar.gz` 二进制包和 `phoenix-5.0.0-hbase-2.0.tar.gz` 中的 `phoenix-5.0.0-server.jar` ，仓库体积比较大，这也是无奈，毕竟在国内从 apache 历史仓库下载 hbase 历史版本的体验简直就是噩梦。

```
git clone https://github.com/Al-assad/docker-hbase.git
```

国内环境可以从 gitee 镜像仓库下载，毕竟 github 小水管不是吹的；

```
git clone https://gitee.com/assad/docker-hbase.git
```

<br>

### 构建镜像

docker-compose 构建基础镜像。

```
make build
```

<br>

### 运行 Standalone 版本

`Standalone` 版本依赖结构与 [quickstart HBase documentation](https://hbase.apache.org/book.html#quickstart) 一致，只不过使用了 `Hadoop` 的 `HDFS` 版本作为底层储存。

主要用于开发测试环境的快速搭建。

```
docker-compose -f docker-compose-standalone.yml up -d
```

<br>

### 运行 Local Distributed 伪分布式版本

运行该版本会使用一个独立的 `Zookeeper`，`HMaster` 节点和 `HResgionserver`  节点也会分开为独立容器。

```
docker-compose -f docker-compose-distributed-local.yml up -d
```

