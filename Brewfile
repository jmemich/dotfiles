# Run: brew bundle --file=~/dotfiles/Brewfile
# Idempotent — re-run anytime to top up.
# Kept minimal; add entries only as tools are deliberately adopted.

# Terminal
cask "ghostty"
brew "tmux"          # multiplexer; needs >=3.3 for allow-passthrough (kitty img protocol)

# Editor
brew "vim"           # built with +python3 — required by vim-slime / vim-ipython-cell

# Python — modern interpreter for vim's +python3 and general use.
# Per-project envs still use uv; this is just the base python3 on PATH.
brew "python"

# Version control
brew "git"          # current git; macOS ships Apple Git 2.24 — agent-configs /build uses git worktrees

# Shell
brew "starship"     # prompt
brew "atuin"        # shell history (Ctrl+R upgrade)

# Font (powers Ghostty + starship)
cask "font-jetbrains-mono-nerd-font"
