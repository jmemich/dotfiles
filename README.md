# dotfiles

Personal macOS / Linux dev environment config. Designed to bootstrap a fresh Mac, a Linux server, or a Docker container with minimum ceremony.

## Layout

```
dotfiles/
├── setup.sh                 # one-shot install entry point
├── Brewfile                 # macOS package list (brew bundle)
│
├── zsh/                     # shell config
├── tmux/                    # terminal multiplexer
├── git/                     # version control
├── vim/                     # editor (plugins via vim-plug, no submodules)
├── ghostty/                 # terminal emulator (macOS + Linux)
├── sublime/                 # Sublime Text settings + keymap
└── agent-configs/           # SUBMODULE — AI agent config (Claude, Cursor, shared rules)
```

One folder per tool, mirroring the layout the tool expects under `$HOME`. Compatible with `stow` and with the setup script.

## Setup

```bash
git clone --recurse-submodules https://github.com/jmemich/dotfiles ~/dotfiles
cd ~/dotfiles
./setup.sh
```

`setup.sh` is idempotent. Safe to re-run.

## Conventions

- `zsh/local.zsh` is gitignored — per-machine paths and secrets live there.
- Vim plugins are declared in `vim/.vimrc` via vim-plug. Run `:PlugInstall` inside vim after first clone.
- Agent configs live in a separate repo, pulled in as a submodule.
