# dsh-chat-timeline-plus

[**English**](README.en.md) | 简体中文

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![npm version](https://img.shields.io/npm/v/dsh-chat-timeline-plus.svg)](https://www.npmjs.com/package/dsh-chat-timeline-plus)

DeepSeek Harness（DSH）消息时间线：右侧常驻导航轨 + 悬停展开面板，**悬停即预览问答，一键钉住常驻**。

> 非 DeepSeek 官方出品。部分功能继承自 [dsh-chat-timeline](https://github.com/jjxjjjjiik-bot/dsh-chat-timeline)。

## 功能

### 悬停问答预览

鼠标在时间线条目上停留约 0.35 秒，左侧浮出预览卡，**同时显示该轮的问题与回答摘要**——不用跳转就能定位是哪一轮对话：

- 上半区：问题全文（自动截断）
- 下半区：该轮回答的文本摘要（跳过思考与工具调用）
- 浅色/深色主题适配，移开自动消失

### 面板钉住

展开面板左上角的图钉：点击**钉住**后面板常驻展开，鼠标移开不收起；再点取消。按会话记忆，切回自动恢复。

### 重点书签

`★` 加星标记重点问答，折叠态显示金色指示线，「只看标记 (n)」一键筛选。

### 其它

- 点击条目平滑跳转到对应消息（按需加载历史，防抖不抖动）
- 与回退/撤回联动，失效消息自动剔除
- 避让右侧工作台；窄屏（≤767px）自动隐藏
- 浅色/深色主题、ARIA 无障碍、键盘导航

## 安装

```bash
dsh plugin add dsh-chat-timeline-plus
```

安装后重启 dsh web 并刷新浏览器。源码安装见 [English 文档](README.en.md)。

## License

MIT，见 [LICENSE](LICENSE)。
