FROM ubuntu:latest

# 安装基础依赖
RUN apt update && apt install -y curl tar bash

# 下载并解压 X-ui 二进制包（这是完整路径，请确保不要复制丢了）
RUN curl -L "https://github.com" -o x-ui.tar.gz \
    && tar zxvf x-ui.tar.gz \
    && rm x-ui.tar.gz \
    && mv x-ui /usr/local/ \
    && chmod +x /usr/local/x-ui/x-ui

# 设置工作目录
WORKDIR /usr/local/x-ui

# 暴露面板端口
EXPOSE 54321

# 启动命令
CMD ["./x-ui"]
