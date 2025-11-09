#!/bin/bash

# 喵宇宙启动脚本 - Miao Universe Startup Script

echo "🐱 启动喵宇宙..."
echo ""

# 检查 Python 是否安装
if ! command -v python3 &> /dev/null; then
    echo "❌ 错误: 未找到 Python3，请先安装 Python"
    exit 1
fi

# 启动后端服务
echo "📡 启动后端服务..."
cd api

# 检查虚拟环境
if [ ! -d "venv" ]; then
    echo "📦 创建虚拟环境..."
    python3 -m venv venv
fi

# 激活虚拟环境
source venv/bin/activate

# 安装依赖
if [ ! -f "venv/.installed" ]; then
    echo "📥 安装依赖..."
    pip install -r requirements.txt
    touch venv/.installed
fi

# 启动后端
echo "✅ 后端服务启动中..."
uvicorn main:app --reload --host 0.0.0.0 --port 8000 &
BACKEND_PID=$!

cd ..

# 等待后端启动
sleep 3

# 启动前端服务
echo ""
echo "🌐 启动前端服务..."
python3 -m http.server 3000 &
FRONTEND_PID=$!

# 等待前端启动
sleep 2

echo ""
echo "✨ 喵宇宙已启动！"
echo ""
echo "📱 前端地址: http://localhost:3000"
echo "📡 后端地址: http://localhost:8000"
echo "📖 API 文档: http://localhost:8000/docs"
echo ""
echo "按 Ctrl+C 停止服务"
echo ""

# 等待用户中断
trap "echo ''; echo '👋 正在停止服务...'; kill $BACKEND_PID $FRONTEND_PID; exit" INT
wait
