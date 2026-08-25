# dsh-chat-timeline-plus

[**English**](README.en.md) | 简体中文

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![npm version](https://img.shields.io/npm/v/dsh-chat-timeline-plus.svg)](https://www.npmjs.com/package/dsh-chat-timeline-plus)

> **增强版 fork**：基于 [jjxjjjjiik-bot/dsh-chat-timeline](https://github.com/jjxjjjjiik-bot/dsh-chat-timeline) v0.1.4（MIT），感谢原作者与所有上游贡献者。上游的全部能力都保留，并在其上新增了本仓库的特性。

DeepSeek Harness（DSH）右侧消息时间线增强版——常驻导航轨 + 悬停展开面板，**新增悬停问答预览与面板钉住**。

> 非 DeepSeek 官方出品，与 DeepSeek 无任何关联。

## ✨ 本 fork 新增

### 悬停问答预览

鼠标在时间线条目上停留约 0.35 秒，左侧浮出预览卡片，**同时显示该轮的问题与回答摘要**——不用跳转就能快速定位「这是哪一轮对话」：

- 上半区：问题全文（自动截断）
- 下半区：该轮回答的文本摘要（跳过思考与工具调用，只取正文）
- 浅色/深色主题各自适配，移开鼠标自动消失，不遮挡任何面板内容

### 面板钉住（常驻展开）

展开面板左上角的图钉：点击**钉住**后面板常驻展开，鼠标移开不再收起；再点取消。钉住状态按会话记忆（localStorage），切回该会话自动恢复。图标与颜色语言和面板内其它元素统一（未钉 = 线稿灰，钉住 = 主题色实心）。

### 样式修复（对上游 v0.1.4）

- **收起态「只看标记」悬空**：上游 v0.1.4 的筛选行缺少收起隐藏规则，面板收起时按钮悬空显示；本版补回显隐联动
- **按钮视觉极简化**：「只看标记」与星标按钮改为纯文字样式（无边框、无底色，状态只靠颜色与字重表达），跨主题一致
- **星标激活色补全**：上游 star_on 激活态规则缺失导致加星后无色；本版补齐并统一为与「只看标记」一致的金黄色系

## 📦 继承自上游的能力（v0.1.4）

- **常驻右侧导航轨**——每条用户消息一个指示线，与 DeepSeek 官网折叠态一致
- **重点书签与筛选**——★ 加星标记，折叠态金色指示线，「只看标记 (n)」一键筛选
- **平滑跳转与防抖**——点击条目跳转（按需加载历史），防抖锁定消除长对话跳转抖动
- **回退撤回联动**——与 dsh-rewind 联动，被回退的消息自动剔除
- **动态避让 / 窄屏适配 / 无障碍**——避让右侧工作台、≤767px 自动隐藏、ARIA + 键盘导航

## 安装

### 方式一：npm 一键安装（推荐）

```bash
dsh plugin add dsh-chat-timeline-plus
```

或指定 profile：

```bash
dsh plugin --profile web add dsh-chat-timeline-plus
```

安装后重启 dsh web 并刷新浏览器。

### 方式二：从源码安装

```bash
git clone https://github.com/NIU-001-LIU/dsh-chat-timeline-plus.git
cd dsh-chat-timeline-plus
# Windows 双击 install.bat，或参见 README.en.md 的手动注册步骤
```

## 工作原理

Host 侧通过会话投影（dshChatTimeline）持久化枚举用户消息，并把每轮回答的文本块**归并为 80 字符摘要**（reply 字段）随条目下发；客户端 TimelineRail 渲染导航轨（conversation.input.dock 插槽，portal 到 body），悬停预览卡读取 reply 字段。数据源按速度优先：投影 → 已加载节点 → 后台 loadOlder（后两者在收集时同步推导回复摘要）。

## 与上游的关系

- 上游：[jjxjjjjiik-bot/dsh-chat-timeline](https://github.com/jjxjjjjiik-bot/dsh-chat-timeline)（MIT）
- 本仓库保持对上游的可合并性：功能均为增量修改，host 投影新增 reply 字段向后兼容（旧客户端忽略）
- 欢迎上游 cherry-pick；也欢迎直接对本仓库提 PR

## License

MIT——继承自上游，见 [LICENSE](LICENSE)。
