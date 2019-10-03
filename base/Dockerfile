FROM openjdk:8
MAINTAINER yulinying <yulinying_1994@outlook.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends net-tools curl netcat

ENV HBASE_VERSION 2.0.5
ENV PHOENIX_VERSION 5.0.0
ENV HBASE_URL http://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz

COPY asserts/hbase-$HBASE_VERSION.tar.gz.aa /tmp/
COPY asserts/hbase-$HBASE_VERSION.tar.gz.ab /tmp/
COPY asserts/hbase-$HBASE_VERSION.tar.gz.ac /tmp/
COPY asserts/hadoop-native.tar.gz /tmp/
COPY asserts/phoenix-$PHOENIX_VERSION.tar.gz /tmp/

RUN set -x \
    && cat /tmp/hbase-$HBASE_VERSION.tar.gz.a* | tar -zx -C /opt/ \
    && tar -xvf /tmp/hadoop-native.tar.gz -C /opt/hbase-$HBASE_VERSION/lib/ \
    && tar -xvf /tmp/phoenix-$PHOENIX_VERSION.tar.gz -C /opt/hbase-$HBASE_VERSION/lib/ \
    && rm /tmp/**.tar.gz.*

RUN ln -s /opt/hbase-$HBASE_VERSION/conf /etc/hbase
RUN mkdir /opt/hbase-$HBASE_VERSION/logs

RUN mkdir /hadoop-data

ENV HBASE_PREFIX=/opt/hbase-$HBASE_VERSION
ENV HBASE_CONF_DIR=/etc/hbase

ENV USER=root
ENV PATH $HBASE_PREFIX/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
