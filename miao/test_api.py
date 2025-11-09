#!/usr/bin/env python3
"""
简单的 API 测试脚本
测试后端 API 是否正常工作
"""

import requests
import json

API_BASE = "http://localhost:8000"

def test_api():
    print("🧪 测试喵宇宙 API...\n")

    # Test 1: Get all cats
    print("1️⃣ 测试获取所有猫咪数据 (GET /api/cats)")
    try:
        response = requests.get(f"{API_BASE}/api/cats")
        if response.status_code == 200:
            cats = response.json()
            print(f"   ✅ 成功！获取到 {len(cats)} 只猫咪")
            if cats:
                print(f"   第一只猫咪: {cats[0]['name']}")
        else:
            print(f"   ❌ 失败！状态码: {response.status_code}")
    except Exception as e:
        print(f"   ❌ 错误: {e}")
    print()

    # Test 2: Get single cat
    print("2️⃣ 测试获取单个猫咪 (GET /api/cats/1)")
    try:
        response = requests.get(f"{API_BASE}/api/cats/1")
        if response.status_code == 200:
            cat = response.json()
            print(f"   ✅ 成功！猫咪名字: {cat['name']}")
        else:
            print(f"   ❌ 失败！状态码: {response.status_code}")
    except Exception as e:
        print(f"   ❌ 错误: {e}")
    print()

    # Test 3: Update cat info
    print("3️⃣ 测试更新猫咪信息 (PUT /api/cats/1)")
    try:
        update_data = {
            "name": "小橘（测试）",
            "description": "这是一个API测试"
        }
        response = requests.put(
            f"{API_BASE}/api/cats/1",
            json=update_data,
            headers={"Content-Type": "application/json"}
        )
        if response.status_code == 200:
            cat = response.json()
            print(f"   ✅ 成功！更新后的名字: {cat['name']}")
        else:
            print(f"   ❌ 失败！状态码: {response.status_code}")
    except Exception as e:
        print(f"   ❌ 错误: {e}")
    print()

    # Test 4: Restore original name
    print("4️⃣ 恢复原始名字 (PUT /api/cats/1)")
    try:
        update_data = {
            "name": "小橘"
        }
        response = requests.put(
            f"{API_BASE}/api/cats/1",
            json=update_data,
            headers={"Content-Type": "application/json"}
        )
        if response.status_code == 200:
            print(f"   ✅ 成功！已恢复")
        else:
            print(f"   ❌ 失败！状态码: {response.status_code}")
    except Exception as e:
        print(f"   ❌ 错误: {e}")
    print()

    print("✨ 测试完成！")

if __name__ == "__main__":
    try:
        test_api()
    except requests.exceptions.ConnectionError:
        print("❌ 无法连接到后端服务！")
        print("请确保后端服务已启动: uvicorn main:app --reload")
