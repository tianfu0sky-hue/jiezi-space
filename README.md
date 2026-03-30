# 芥子空间 (Jiezi Space)

一款精美的卡片式收藏管理应用，基于 Flutter 开发。

## 📱 功能特性

- ✨ 卡片式 UI 设计，美观直观
- 🏷️ 支持多种状态标签（使用中、珍惜、传说）
- 🔍 快速筛选分类
- 📸 支持拍照/相册添加
- 🌙 支持亮暗主题

## 🚀 快速开始

### 环境要求

- Flutter SDK >= 3.0.0
- Dart >= 3.0.0
- Android Studio / Xcode

### 安装依赖

```bash
flutter pub get
```

### 运行应用

```bash
flutter run
```

### 构建 APK

```bash
flutter build apk --release
```

## 📦 自动构建

本项目配置了 GitHub Actions，每次推送到 main 分支会自动构建 APK。

- 构建产物在 Actions 页面下载
- 创建 `v*` 标签时会自动发布 Release

## 📁 项目结构

```
lib/
├── main.dart              # 应用入口
├── models/                # 数据模型
│   └── card_model.dart
├── screens/               # 页面
│   └── home_screen.dart
├── widgets/               # 组件
│   ├── top_bar.dart
│   ├── filter_bar.dart
│   ├── card_item.dart
│   └── add_button.dart
└── theme/                 # 主题配置
    └── app_theme.dart
```

## 🎨 设计来源

基于 Figma 设计稿开发：
- 卡片式布局
- 状态标签系统
- 顶部金币/积分系统

## 📄 许可证

MIT License

## 👤 作者

Created for tianfu0sky-hue
