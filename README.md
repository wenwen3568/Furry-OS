🐾 Furry OS — 属于毛毛们的操作系统

> 一款基于 Ubuntu，为福瑞爱好者量身定制的 Linux 发行版。  
> 开机即见温暖爪印，轻松运行 Windows 游戏与软件。  
> **Furry 元素无处不在，从安装到桌面，全程陪伴。**

![Furry OS 壁纸示例](https://via.placeholder.com/800x400?text=🐾+Your+Furry+Wallpaper+Here)  
*(将你的壁纸放在 `config/includes.chroot/usr/share/backgrounds/furry-wallpaper.png` 即可替换)*

---

## ✨ 特色亮点

- 🖼️ **自带 Furry 主题壁纸** —— 默认壁纸融入爪印与暖色，开机即沉浸。
- 🐾 **小兽爪品牌图标** —— 安装程序、启动菜单都带有专属爪印 Logo，充满个性。
- 🎮 **内置 Wine 兼容层** —— 直接运行 `.exe` 程序，玩转 Windows 游戏与工具。
- 🖥️ **图形化安装向导** —— 基于 Calamares，几步完成安装，分区、建账户全图形界面。
- 🔒 **本地账户 + 开机登录** —— 安装时创建专属账号，重启后安全登录。
- 🚀 **轻量、流畅** —— 基于 GNOME 桌面，适配现代 x64 硬件，操作体验丝滑。

---

## 📥 下载与安装

### 1. 获取 ISO 镜像
- 访问本仓库的 **Releases** 页面，下载最新的 `furry-os-amd64.iso`。
- 或者从 GitHub Actions 的 Artifacts 中获取最新构建版。

### 2. 制作启动 U 盘
推荐使用 [balenaEtcher](https://www.balena.io/etcher/) 或 [Rufus](https://rufus.ie/)：
- 插入 U 盘（至少 8GB）
- 选择下载好的 ISO 文件
- 写入 U 盘，等待完成

### 3. 从 U 盘启动
- 重启电脑，进入 BIOS/UEFI 设置（通常按 `F2`/`F12`/`Del`）
- 将 U 盘设为第一启动项
- 保存并重启，即可进入 Furry OS 的 Live 环境

### 4. 开始安装
- 在 Live 桌面双击 **“安装 Furry OS”** 图标
- 按照图形向导选择语言、分区、创建用户
- 等待安装完成，重启后即可进入你专属的 Furry 世界！

---

## 🎮 如何使用 Windows 软件

安装完成后，你可以通过以下方式运行 Windows 程序：

- **终端方式**：打开终端，输入 `wine 你的程序.exe`
- **图形界面**：右键点击 `.exe` 文件，选择“用 Wine 打开”
- 高级用户可安装 **Bottles** 或 **PlayOnLinux** 管理多版本 Wine 环境

> 💡 提示：首次运行 Wine 时会自动安装 Mono 和 Gecko 组件，请保持网络畅通。

---

## 🛠️ 开发者 & 自定义构建

本项目使用 `live-build` 构建，所有定制化脚本均开源。如果你想自己构建 ISO：

```bash
# 克隆仓库
git clone https://github.com/wenwen3568/Furry-OS.git
cd Furry-OS

# 安装构建依赖（Ubuntu/Debian）
sudo apt install live-build debootstrap squashfs-tools xorriso isolinux syslinux-utils mtools dosfstools

# 构建 ISO
sudo lb clean --purge
sudo lb config
sudo lb build
构建完成后，ISO 文件位于 live-image-amd64.hybrid.iso。

你也可以通过 GitHub Actions 自动构建 —— 推送代码到 main 分支或创建 Release 即可触发

