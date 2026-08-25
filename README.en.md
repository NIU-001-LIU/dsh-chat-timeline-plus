# dsh-chat-timeline-plus

English | [**简体中文**](README.md)

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![npm version](https://img.shields.io/npm/v/dsh-chat-timeline-plus.svg)](https://www.npmjs.com/package/dsh-chat-timeline-plus)

> **Enhanced fork** of [jjxjjjjiik-bot/dsh-chat-timeline](https://github.com/jjxjjjjiik-bot/dsh-chat-timeline) v0.1.4 (MIT). All upstream features are preserved; this repo adds on top.

A message-timeline rail for DeepSeek Harness (DSH) — collapsed rail + hover-expanded panel, **plus hover Q&A preview and panel pinning**.

> Not affiliated with DeepSeek.

## ✨ What this fork adds

### Hover Q&A preview

Rest the pointer on a timeline entry for ~0.35s and a floating card appears to the left, showing **both the question and that turn's reply digest** — locate a turn without jumping to it:

- Top: the full question (truncated)
- Bottom: the reply's text digest (reasoning and tool calls skipped)
- Light/dark themes supported; auto-dismisses on pointer-out, never overlaps the panel

### Panel pin

The pin at the expanded panel's top-left: click to **pin** — the panel stays open when the pointer leaves; click again to unpin. Pinned state is remembered per session (localStorage) and restored on return. Visual language matches the panel (outline grey when unpinned, filled accent when pinned).

### Style fixes over upstream v0.1.4

- **Collapsed-state filter leak**: upstream v0.1.4 lacks the hide rule for the filter row, so the "marks only" button floats over the collapsed rail; restored here
- **Minimalist buttons**: the filter and star buttons are plain text now (no border, no fill — state carried by color and weight only), consistent across themes
- **Star active color restored**: upstream ships no `star_on` rule, so marked stars render colorless; filled in and unified with the filter's amber palette

## 📦 Inherited from upstream (v0.1.4)

- **Persistent right rail** — one indicator line per user message, matching DeepSeek's web UI
- **Bookmarks & filter** — star to mark, gold indicator lines when collapsed, "marks only (n)" filter
- **Smooth jump with debounce** — click to jump (loads older history on demand); freeze-lock kills panel jitter on long jumps
- **Rewind integration** — rewound messages drop off the timeline automatically
- **Avoidance / narrow screens / a11y** — dodges right-side workbenches, hides ≤767px, ARIA + keyboard nav

## Install

### Option 1: npm (recommended)

```bash
dsh plugin add dsh-chat-timeline-plus
```

Or per profile:

```bash
dsh plugin --profile web add dsh-chat-timeline-plus
```

Restart `dsh web` and reload the browser afterwards.

### Option 2: from source

```bash
git clone https://github.com/NIU-001-LIU/dsh-chat-timeline-plus.git
cd dsh-chat-timeline-plus
# Windows: double-click install.bat; manual registration steps below
```

## How it works

The host projection (`dshChatTimeline`) enumerates user messages and merges each turn's assistant text blocks into an **80-char digest** (the `reply` field) shipped with every entry. The client `TimelineRail` renders the rail (mounted in the `conversation.input.dock` slot, portalled to body); the hover card reads `reply`. Data sources, fastest first: projection → loaded nodes → background `loadOlder` (the latter two derive the digest at collect time).

## Relationship to upstream

- Upstream: [jjxjjjjiik-bot/dsh-chat-timeline](https://github.com/jjxjjjjiik-bot/dsh-chat-timeline) (MIT)
- This repo stays mergeable against upstream: all changes are additive, and the new `reply` projection field is backward compatible (old clients ignore it)
- Upstream is welcome to cherry-pick; PRs to this repo are welcome too

## License

MIT — inherited from upstream, see [LICENSE](LICENSE).
