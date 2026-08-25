# dsh-chat-timeline-plus

[**English**](README.en.md) | 简体中文

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![npm version](https://img.shields.io/npm/v/dsh-chat-timeline-plus.svg)](https://www.npmjs.com/package/dsh-chat-timeline-plus)

DeepSeek Harness（DSH）消息时间线：右侧常驻导航轨 + 悬停展开面板，**悬停即预览问答，一键钉住常驻**。

> 非 DeepSeek 官方出品。部分功能继承自 [dsh-chat-timeline](https://github.com/jjxjjjjiik-bot/dsh-chat-timeline)。

## 功能

### 悬停问答预览

鼠标在时间线条目上停留约 0.35 秒，左侧浮出预览卡，**同时显示该轮的问题与回答摘要**——不用跳转就能定位是哪一轮对话：

- 顶部：该轮的完整时间戳（如 `2026-08-25 14:32`）
- 上半区：问题全文（固定宽卡片，自动截断）
- 下半区：该轮回答的文本摘要（跳过思考与工具调用）
- 浅色/深色主题适配，移开自动消失

### 面板钉住

展开面板左上角的图钉：点击**钉住**后面板常驻展开，鼠标移开不收起；再点取消。按会话记忆，切回自动恢复。

### 重点书签

`★` 加星标记重点问答，折叠态显示金色指示线，「只看标记 (n)」一键筛选。

### 按天分组

面板中跨天的消息自动插入日期分隔行（**今天 / 昨天 / YYYY-MM-DD**），长会话一眼看清时间脉络。

### 其它

- 点击条目平滑跳转到对应消息（按需加载历史，防抖不抖动）
- 与回退/撤回联动，失效消息自动剔除
- 避让右侧工作台；窄屏（≤767px）自动隐藏
- 浅色/深色主题、ARIA 无障碍、键盘导航

## 安装

### 方式一：dsh 命令（推荐）

```bash
# 当前 profile（通常是 web）
dsh plugin add dsh-chat-timeline-plus

# 或明确指定 profile
dsh plugin --profile web add dsh-chat-timeline-plus
```

该命令会自动：npm 拉包 → 写入 profile 依赖 → 注册 bundle（cordis.patch.yml）→ pnpm install。

### 方式二：npm 直接安装到 profile

适合不通过 dsh CLI 管理插件的用户：

```bash
cd ~/.dsh/profiles/web
npm install dsh-chat-timeline-plus   # 或 pnpm add
```

然后编辑该目录的 `package.json`，在 `dsh.profile.bundles` 数组中加入：

```jsonc
{
  "dsh": {
    "profile": {
      "bundles": [ /* …, */ "dsh-chat-timeline-plus" ]
    }
  }
}
```

### 方式三：源码 / 本地路径安装

```bash
git clone https://github.com/NIU-001-LIU/dsh-chat-timeline-plus.git
cd dsh-chat-timeline-plus
```

- **Windows**：双击 `install.bat`（自动复制到 profile 并注册）
- **手动**：把整个目录复制到 `~/.dsh/profiles/web/plugins/dsh-chat-timeline-plus/`，依赖写 `"file:plugins/dsh-chat-timeline-plus"`，再按方式二加入 bundles 数组

> Desktop 用户：profile 目录在 `~/.dsh/profiles/desktop`，步骤相同。

### 生效与验证

1. 重启 dsh（web 或 Desktop）
2. 打开任意会话，右侧应出现时间线导航轨
3. 悬停条目约 0.35 秒出现问答预览卡；展开面板左上角有图钉

验证加载（可选）：浏览器访问 dsh 服务首页，页面源码 `__DSH_BOOT__` 清单里应含 `dsh-chat-timeline-plus`。

### 卸载

```bash
dsh plugin remove dsh-chat-timeline-plus
```

或手动：从 bundles 数组移除条目 → 删依赖 → `pnpm install` → 重启。

### 常见问题

- **装了没出现**：确认 bundles 数组拼写、重启了 dsh；查 `plugin-management/state.json` 的 `disabledBundles`（崩溃插件会被自动禁用，清空后重启）
- **本机改了源码不生效**：profile 的 node_modules 是复制不是链接，改动后需重新复制 `lib/` 并重启

## License

MIT，见 [LICENSE](LICENSE)。
