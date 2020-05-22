FROM ubuntu:18.04 AS hadoop-environment-base

MAINTAINER liuxiangxi12@163.com

USER root

RUN apt update
RUN apt install -y openssh-server openssh-client
RUN apt install -y vim curl net-tools wget openssl
RUN apt install -y openjdk-8-jdk
RUN apt install -y cmake maven findbugs zlib1g-dev libcurl4-openssl-dev ant libssl-dev build-essential libglib2.0-dev 
RUN apt install -y autoconf automake gcc g++ libtool

#无效
#RUN ln -s /usr/bin/openssl /usr/local/include/

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV LD_LIBRARY_PATH /usr/local/lib

ENV HADOOP_VERSION 3.1.0
#ENV HADOOP_URL https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz 
ENV HADOOP_SRC_URL https://archive.apache.org/dist/hadoop/core/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION-src.tar.gz 
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION

ENV PROTOBUF_VERSION 2.5.0
ENV PROTOBUF_URL https://github.com/google/protobuf/releases/download/v$PROTOBUF_VERSION/protobuf-$PROTOBUF_VERSION.tar.gz

ENV HADOOP_COMMON_LIB_NATIVE_DIR $HADOOP_HOME/lib/native
ENV HADOOP_OPTS "-Djava.library.path=$HADOOP_COMMON_LIB_NATIVE_DIR"
ENV PATH $PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
ENV HDFS_DATANODE_SECURE_USER root
ENV HDFS_SECONDARYNAMENODE_USER root
ENV HDFS_NAMENODE_USER root
ENV HDFS_DATANODE_USER root
ENV YARN_RESOURCEMANAGER_USER root
ENV YARN_NODEMANAGER_USER root 
ENV PDSH_RCMD_TYPE ssh
ENV YARN_HEAPSIZE 3072
ENV YARN_RESOURCEMANAGER_HEAPSIZE 3072

RUN set -x \
	&& curl -fSL "$PROTOBUF_URL" -o /tmp/protobuf.tar.gz \
	&& tar -xvf /tmp/protobuf.tar.gz -C /opt/ \
	&& rm /tmp/protobuf.tar.gz*

RUN cd /opt/protobuf-$PROTOBUF_VERSION \
	&& ./configure --prefix=/usr/local \
	&& make && make install 

RUN set -x \
	&& curl -fSL "$HADOOP_SRC_URL" -o /tmp/hadoop_src.tar.gz \
	&& tar -xvf /tmp/hadoop_src.tar.gz -C /opt/ \
	&& rm /tmp/hadoop_src.tar.gz*

RUN cd /opt/hadoop-$HADOOP_VERSION-src \
	&& mvn package -Pdist,native -DskipTests -Dtar \
	&& mv /opt/hadoop-$HADOOP_VERSION-src/hadoop-dist/target/hadoop-$HADOOP_VERSION /opt/

COPY entrypoint.sh /opt/entrypoint.sh
RUN chmod a+x /opt/entrypoint.sh

##
##
#FROM hadoop-environment-base AS hdfs-environment
##
##

#OPENSSH
EXPOSE 22

#HDFS
EXPOSE 9000 9864 9866 9867 9868 9870

#YARN
EXPOSE 8030 8031 8032 8033 8040 8042 8088 

ENTRYPOINT ["/bin/bash", "-c", "/opt/entrypoint.sh"]
