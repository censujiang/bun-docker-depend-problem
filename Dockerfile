# 选择基础镜像为 Node.js 20
FROM oven/bun:latest

# 设置工作目录
WORKDIR /usr/src/app

# 复制应用代码（仅复制.output文件夹，.output文件夹中包含了编译后的代码）
COPY .output .output

# 进入.output/server目录安装依赖
WORKDIR /usr/src/app/.output/server

# 安装依赖（可能需要bun来亲自重新安装依赖才能知道依赖关系在哪）
RUN bun install ofetch

# 返回工作目录
WORKDIR /usr/src/app

# 暴露端口 3000
EXPOSE 3000

# 启动应用（使用bun .output/server/index.mjs启动）
CMD ["bun", ".output/server/index.mjs"]