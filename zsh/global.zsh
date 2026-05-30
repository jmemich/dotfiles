# global.zsh — committed shared zsh config

# Path
# Homebrew (Apple Silicon path first, Intel fallback)
[[ -x /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# Editor + locale
export EDITOR=vim
export LANG=en_US.UTF-8

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Completion
autoload -Uz compinit && compinit

# Aliases
alias l='ls -la'
alias ..='cd ..'
alias ...='cd ../..'
alias md='glow'               # render markdown in the terminal (glow -p to page)
alias stay='caffeinate -i'    # keep mac awake while a process runs, e.g. stay uv run …

# Starship prompt
command -v starship >/dev/null && eval "$(starship init zsh)"

# Atuin history (better Ctrl+R)
command -v atuin >/dev/null && eval "$(atuin init zsh)"
