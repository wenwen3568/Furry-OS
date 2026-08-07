#!/bin/bash
# Calamares post-install script
# 替换为国内镜像源 + 安装常用软件和 Java

set -e

LOG_FILE="/root/software-install.log"
> "$LOG_FILE"

# ===== 1. 替换为清华镜像源 =====
echo "替换 APT 源为清华镜像..." | tee -a "$LOG_FILE"
cat > /etc/apt/sources.list << 'EOF'
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
EOF

# ===== 2. 软件列表 =====
SOFTWARE="
vlc
firefox
gimp
libreoffice
openjdk-17-jre
wine
"

SUCCESS=""
FAILED=""

# ===== 3. 显示进度函数 =====
show_progress() {
    if command -v zenity &>/dev/null; then
        echo "$1" | zenity --progress --pulsate --title="正在安装软件" --text="$1" --auto-close 2>/dev/null
    fi
}

# ===== 4. 更新源并安装 =====
show_progress "正在更新软件源（使用清华镜像）..."
apt update >> "$LOG_FILE" 2>&1

for pkg in $SOFTWARE; do
    show_progress "正在安装 $pkg ..."
    if apt install -y "$pkg" >> "$LOG_FILE" 2>&1; then
        SUCCESS="$SUCCESS\n✅ $pkg"
    else
        FAILED="$FAILED\n❌ $pkg"
    fi
done

apt clean >> "$LOG_FILE" 2>&1

# ===== 5. 显示结果 =====
RESULT="安装完成！\n\n成功安装：$SUCCESS\n\n失败：$FAILED"
if command -v zenity &>/dev/null; then
    zenity --info --text="$RESULT" --title="软件安装报告" --width=400 2>/dev/null
else
    echo -e "$RESULT" > /root/install-report.txt
fi

echo -e "$RESULT" >> "$LOG_FILE"
