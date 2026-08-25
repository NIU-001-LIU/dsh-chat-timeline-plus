# dsh-chat-timeline-plus

English | [**简体中文**](README.md)

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![npm version](https://img.shields.io/npm/v/dsh-chat-timeline-plus.svg)](https://www.npmjs.com/package/dsh-chat-timeline-plus)

A message timeline for DeepSeek Harness (DSH): persistent right rail + hover panel, **hover to preview the Q&A, pin to keep it open**.

> Not affiliated with DeepSeek. Some features inherited from [dsh-chat-timeline](https://github.com/jjxjjjjiik-bot/dsh-chat-timeline).

## Features

### Hover Q&A preview

Rest the pointer on an entry for ~0.35s and a card appears to the left showing **both the question and that turn's reply digest** — locate a turn without jumping to it:

- Top: the full question (truncated)
- Bottom: the reply's text digest (reasoning and tool calls skipped)
- Light/dark themes; auto-dismisses on pointer-out

### Panel pin

The pin at the panel's top-left: click to **pin** — the panel stays open when the pointer leaves; click again to unpin. Remembered per session, restored on return.

### Bookmarks

Star messages to mark key turns; marked entries get gold indicator lines when collapsed, and a "marks only (n)" filter.

### More

- Click an entry to jump smoothly (loads history on demand, debounced)
- Rewound/retracted messages drop off automatically
- Dodges right-side workbenches; auto-hides on narrow viewports (≤767px)
- Light/dark themes, ARIA, keyboard navigation

## Install

```bash
dsh plugin add dsh-chat-timeline-plus
```

Restart `dsh web` and reload the browser. For a source install, clone this repo and run `install.bat` (Windows) or register the plugin manually.

## License

MIT, see [LICENSE](LICENSE).
