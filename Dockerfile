FROM ubuntu:latest

ARG TARGETOS TARGETARCH

RUN apt-get update && \
    apt-get install -y wget libasound2 libgbm1 locales fonts-noto-cjk sudo

ENV DEB_FILE=linuxqq_3.2.1-17816_$TARGETARCH.deb

RUN wget https://dldir1.qq.com/qqfile/qq/QQNT/4cb54015/$DEB_FILE
RUN apt-get install -y ./$DEB_FILE && rm -f $DEB_FILE

RUN useradd --create-home  --user-group --home-dir /home user
RUN chown user:user /home
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN locale-gen zh_CN.UTF-8 && update-locale LANG=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8

USER user:user

COPY --chown=user:user entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /home/.config/QQ && chown user:user /home/.config/QQ
VOLUME /home/.config/QQ/ 

ENTRYPOINT ["/entrypoint.sh"]
