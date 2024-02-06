#!/bin/bash

# 检查是否提供了csv文件路径参数
if [ $# -eq 0 ]; then
    echo "请提供csv文件路径作为参数"
    exit 1
fi

# 定义一个空数组用于存储IP地址
ip_array=()

# 从第二个参数开始，依次处理每个csv文件路径
for csv_file in "${@:1}"; do
    # 按行读取csv文件内容并依次处理每一行
    while IFS=',' read -r ip sent received loss delay speed; do
        # 忽略标题行
        if [[ "$ip" != "IP 地址" ]]; then
            # 将IP地址添加到数组中
            ip_array+=("$ip")
        fi
    done < "$csv_file"
done

# 输出IP地址数组中的所有元素
for ip in "${ip_array[@]}"; do
    echo "$ip"
done

