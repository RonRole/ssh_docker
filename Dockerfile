FROM ubuntu:latest

# ROOT_PASSは--build-argから取得
ARG ROOT_PASS

RUN apt-get -y update && \
    apt-get -y install openssh-server && \
    echo "root:${ROOT_PASS}" | chpasswd

EXPOSE 22
# service ssh startのみだとコンテナがexit code 0してしまうので
# /bin/bashもCMDに入れる
CMD service ssh start && /bin/bash