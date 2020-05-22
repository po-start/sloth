FROM golang:1.8.0

MAINTAINER liuxiangxi12@163.com

ENV KINGSHARD_PATH /root/src/github.com/flike/kingshard

RUN apt-get update \
	&& apt-get install -y git \
RUN git clone https://github.com/flike/kingshard.git "$KINGSHARD_PATH" \
	&& cd "$KINGSHARD_PATH" \
	&& source "$KINGSHARD_PATH"/dev.sh \
	&& make

WORKDIR $KINGSHARD_PATH

## CMD [""]
