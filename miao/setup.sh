#!/bin/bash

# 喵宇宙项目快速设置脚本
# Miao Universe Quick Setup Script

set -e

echo "🐱 欢迎使用喵宇宙快速设置脚本"
echo "================================"
echo ""

# 检查 Node.js 是否安装
if ! command -v node &> /dev/null; then
    echo "❌ 错误: 未检测到 Node.js"
    echo "请先安装 Node.js: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js 版本: $(node --version)"
echo ""

# 检查 npm 是否安装
if ! command -v npm &> /dev/null; then
    echo "❌ 错误: 未检测到 npm"
    exit 1
fi

echo "✅ npm 版本: $(npm --version)"
echo ""

# 安装依赖
echo "📦 正在安装依赖..."
npm install

echo ""
echo "✅ 依赖安装完成"
echo ""

# 检查 .env 文件是否存在
if [ ! -f .env ]; then
    echo "⚠️  警告: 未找到 .env 文件"
    echo "正在从 .env.example 创建 .env 文件..."
    cp .env.example .env
    echo "✅ .env 文件已创建"
    echo ""
    echo "⚠️  重要: 请编辑 .env 文件，填入你的 Supabase 密钥"
    echo "   1. 打开 .env 文件"
    echo "   2. 将 SUPABASE_ANON_KEY 替换为你的实际密钥"
    echo "   3. 保存文件"
    echo ""

    # 询问是否立即编辑
    read -p "是否现在打开 .env 文件进行编辑? (y/n) " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if command -v code &> /dev/null; then
            code .env
        elif command -v nano &> /dev/null; then
            nano .env
        elif command -v vim &> /dev/null; then
            vim .env
        else
            echo "请手动编辑 .env 文件"
        fi
    fi
else
    echo "✅ .env 文件已存在"
fi

echo ""
echo "================================"
echo "🎉 设置完成！"
echo ""
echo "下一步操作："
echo "1. 配置 Supabase 数据库"
echo "   - 登录 Supabase Dashboard"
echo "   - 在 SQL Editor 中执行 init.sql"
echo "   - 创建 Storage bucket: cat-photos"
echo "   - 详细步骤请查看 DEPLOY.md"
echo ""
echo "2. 启动开发服务器"
echo "   运行: npm run dev"
echo ""
echo "3. 部署到 Vercel"
echo "   运行: npm run deploy"
echo ""
echo "如需帮助，请查看:"
echo "  - README.md: 项目概述"
echo "  - DEPLOY.md: 详细部署指南"
echo ""
