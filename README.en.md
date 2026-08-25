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

### Option 1: dsh CLI (recommended)

```bash
# current profile (usually web)
dsh plugin add dsh-chat-timeline-plus

# or target a profile explicitly
dsh plugin --profile web add dsh-chat-timeline-plus
```

This pulls from npm, adds the dependency, registers the bundle (cordis.patch.yml) and installs.

### Option 2: npm straight into the profile

For users who manage plugins without the dsh CLI:

```bash
cd ~/.dsh/profiles/web
npm install dsh-chat-timeline-plus   # or pnpm add
```

Then edit `package.json` in that directory and append to `dsh.profile.bundles`:

```jsonc
{
  "dsh": {
    "profile": {
      "bundles": [ /* …, */ "dsh-chat-timeline-plus" ]
    }
  }
}
```

### Option 3: from source / local path

```bash
git clone https://github.com/NIU-001-LIU/dsh-chat-timeline-plus.git
cd dsh-chat-timeline-plus
```

- **Windows**: double-click `install.bat` (copies into the profile and registers)
- **Manual**: copy the folder to `~/.dsh/profiles/web/plugins/dsh-chat-timeline-plus/`, set the dependency to `"file:plugins/dsh-chat-timeline-plus"`, add it to the bundles array as in option 2

> Desktop users: the profile lives at `~/.dsh/profiles/desktop` — same steps.

### Apply & verify

1. Restart dsh (web or Desktop)
2. Open any conversation — the timeline rail appears on the right
3. Hover an entry ~0.35s for the Q&A card; the pin sits top-left of the expanded panel

Optional check: the `__DSH_BOOT__` manifest in the served index should list `dsh-chat-timeline-plus`.

### Uninstall

```bash
dsh plugin remove dsh-chat-timeline-plus
```

Or manually: remove the bundles entry, drop the dependency, reinstall, restart.

### Troubleshooting

- **Installed but nothing shows**: check the bundles spelling, restart dsh; inspect `plugin-management/state.json` — crashed plugins land in `disabledBundles` (clear it and restart)
- **Local edits not taking effect**: the profile node_modules is a copy, not a link — re-copy `lib/` after changes and restart

## License

MIT, see [LICENSE](LICENSE).
