# Maplive_neo

Maplive反编译源码的修改版

## 项目来源

来源于[Maplive_source](https://github.com/Diend2023/Maplive_source)
>一个 Flex / AIR 反编译重建的源码工程，源程序为 **Maplive**（一款基于 ActionScript 3 / Adobe AIR 的 2D 地图编辑器，配合 TMX 地图格式使用）。

## 目录结构

```
Maplive_neo/
├── asconfig.json          # as3mxml 编译配置（VS Code 插件使用）
├── libs/                  # 第三方依赖 SWC
├── src/                   # 反编译源码
│   ├── _Maplive_mx_managers_SystemManager.as   # 程序入口（Document Class）
│   ├── Maplive.as         # 主应用（WindowedApplication）
│   ├── Maplive-app.xml    # AIR 应用描述符（源码目录中的一份）
│   ├── _Maplive_FlexInit.as / _Maplive_Styles.as  # 框架初始化 mixin
│   ├── *_WatcherSetupUtil.as  # Flex 绑定的 watcher 工具类（25 个）
│   ├── views/             # 界面视图（StartPage、ProjectResources、TMXObserve 等）
│   ├── utils/             # 工具类（FileUtils、ProjectUtils、SaveUtils 等）
│   ├── tmx/               # TMX 地图解析
│   ├── dragonBones/       # dragonBones 依赖
│   ├── skins/             # 组件皮肤
│   ├── com/               # 公共组件
│   ├── events/            # 自定义事件（OpenEvent、RightClickEvent 等）
│   ├── button/            # 按钮组件（ButtonBarBase、DrawPan）
│   ├── deng/              # 第三方库（fzip 等）
│   └── _assets/           # 内嵌资源（图标、光标等）
└── bin/                   # 编译产物与运行资源
    ├── Maplive.swf        # 编译输出
    ├── Maplive-app.xml    # AIR 应用描述符（运行用）
```

## 环境要求

- **AIR SDK**：编译与运行均需要，需包含 `mxmlc`、`adl`/`adl64`（如 `E:\AIRSDK\AIRSDK_51.3.3`）。
- **Flex SDK / FFDec FlexSdk**：提供 mx/spark 框架（如 `E:\FFDec\FlexSdk`），通过 `air-config.xml` 加载。
- 编译要求 `--swf-version=51`，需在 Flex SDK 的 `frameworks/libs/player/<版本>/` 下准备对应 `playerglobal.swc`（可与 AIR SDK 共用）。

## 编译

使用 mxmlc（在项目根目录执行）：

```bash
mxmlc --debug=true +configname=air \
  --source-path+=src --library-path+=libs \
  --output=bin/Maplive.swf \
  --default-background-color=#504f5e \
  --default-frame-rate=60 --default-size 1200 800 \
  --swf-version=51 \
  -- src\_Maplive_mx_managers_SystemManager.as
```

编译产物为 `bin/Maplive.swf`。

> 也可使用 VS Code + as3mxml 扩展，直接加载 `asconfig.json` 编译（`mainClass` 已指向 `_Maplive_mx_managers_SystemManager`）。

## 运行

```bash
cd bin
adl64.exe Maplive-app.xml
```

> `adl64.exe` 需在 PATH 中或替换为 AIR SDK 中的实际路径。

## 编码约定

修改反编译源码时遵循以下规则：

- 禁止删除原始代码（只能注释掉）。
- 新增代码行末尾加 `//` 标记，可一键删除还原。
- 新增的独立文件正常编写，无需加标记。

## 致谢

- **jindrapetrik** - [jpexs-decompiler](https://github.com/jindrapetrik/jpexs-decompiler)
- **DragonBones** - [DragonBones](https://github.com/DragonBones/DragonBonesAS)
- **arkeus** - [as3-tiled-reader](https://github.com/arkeus/as3-tiled-reader)
- **Apache** - [Apache Flex](https://flex.apache.org)
- **HARMAN** - [Adobe AIR SDK from HARMAN](https://airsdk.harman.com)

## 声明

所有逻辑部分相关源代码均为原作者 **左眼** （[Rainy](https://github.com/rainyt)、[左眼](https://gitee.com/zygameui)）所有。
