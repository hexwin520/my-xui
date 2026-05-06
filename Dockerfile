FROM ubuntu:latest

# 安装基础工具
RUN apt update && apt install -y curl bash

# 下载原版 X-ui 二进制文件 (不通过脚本，直接下文件)
RUN curl -L https://github.com -o x-ui.tar.gz \
    && tar zxvf x-ui.tar.gz \
    && rm x-ui.tar.gz \
    && cp -f x-ui/x-ui /usr/local/bin/x-ui \
    && chmod +x /usr/local/bin/x-ui

# 暴露面板端口
EXPOSE 54321

# 直接启动二进制文件，跳过 systemd
CMD ["/usr/local/bin/x-ui"]
