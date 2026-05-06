FROM ubuntu:latest

# 安装基础依赖
RUN apt update && apt install -y curl tar bash

# 直接下载官方编译好的最新版二进制包 (AMD64 架构)
RUN curl -L "https://github.com" -o x-ui.tar.gz \
    && tar zxvf x-ui.tar.gz \
    && rm x-ui.tar.gz \
    && mv x-ui /usr/local/ \
    && chmod +x /usr/local/x-ui/x-ui

# 设置工作目录
WORKDIR /usr/local/x-ui

# 暴露面板端口
EXPOSE 54321

# 启动命令：直接运行二进制文件，跳过系统服务检查
CMD ["./x-ui"]
