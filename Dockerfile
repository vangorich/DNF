# 步骤 1: 基础镜像
# 您的脚本是为 CentOS 7 设计的，所以我们从 CentOS 7 开始
FROM centos:7

# 步骤 2: 将仓库文件复制到镜像中
# 将所有文件（install.sh, src/ 文件夹等）复制到容器的 /app 目录中
WORKDIR /app
COPY . .

# 步骤 3: 运行安装脚本
# 赋予脚本执行权限并运行它。
# 这将会在构建镜像时“安装”好所有游戏服务
RUN chmod +x install.sh
RUN ./install.sh

# 步骤 4: 暴露端口
# 警告：您必须找出游戏服务真正使用的端口号。
# DNF 服务器可能需要登录端口、频道端口、游戏端口等。
# 假设它使用 8080 和 8081 (这只是一个例子，您必须查明真相)
# Zeabur 支持 TCP 端口，这正是游戏服务器所需要的
EXPOSE 8080/tcp
EXPOSE 8081/tcp

# 步骤 5: 启动命令
# 警告：您必须找到 `install.sh` 脚本最后用来“启动”服务器的命令。
# 容器启动时，它需要一个前台命令来保持运行。
# install.sh 可能会使用 systemctl 或 nohup，那些在 Docker 中无效。
# 您需要找到那个最终的二进制文件启动命令，例如：
# CMD ["/app/src/dnf_server", "--start"] 
# 
# !!! 下面这行只是一个占位符，您必须将其替换为真正的启动命令 !!!
CMD ["echo", "请替换我为真正的服务器启动命令"]
