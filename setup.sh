#!/usr/bin/env bash
# Setup: install brew packages and symlink dotfiles into $HOME.
# Idempotent — safe to re-run. Skips files that aren't ported yet.

set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
OS="$(uname -s)"

log()  { printf "\033[1;34m==>\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m!!\033[0m %s\n" "$*" >&2; }

# ----------------------------------------------------------------------------
# Submodules
# ----------------------------------------------------------------------------
log "Initializing submodules"
git -C "$DOTFILES" submodule update --init --recursive

# ----------------------------------------------------------------------------
# Homebrew (macOS only)
# ----------------------------------------------------------------------------
if [[ "$OS" == "Darwin" ]]; then
    if ! command -v brew >/dev/null 2>&1; then
        log "Installing Homebrew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    log "brew bundle"
    brew bundle --file="$DOTFILES/Brewfile"

elif [[ "$OS" == "Linux" ]]; then
    log "Linux detected — using apt + curl installers"
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update -qq
        sudo apt-get install -y zsh tmux vim python3 git curl
    else
        warn "apt-get not found — install zsh, tmux, vim, python3, git, curl manually."
    fi
    if ! command -v starship >/dev/null 2>&1; then
        log "Installing starship"
        curl -sS https://starship.rs/install.sh | sh -s -- -y
    fi
    if ! command -v atuin >/dev/null 2>&1; then
        log "Installing atuin"
        curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    fi

else
    warn "Unknown OS ($OS) — skipping package install."
fi

# ----------------------------------------------------------------------------
# Symlinks
# ----------------------------------------------------------------------------
# Each entry: link <source_relative_to_dotfiles> <target_under_home>
# Sources that don't exist yet are skipped silently — tools are ported one at a time.
link() {
    local src="$DOTFILES/$1"
    local dst="$HOME/$2"
    if [[ ! -e "$src" ]]; then
        return  # not ported yet
    fi
    if [[ -e "$dst" && ! -L "$dst" ]]; then
        warn "Skipping $dst (real file/dir; move it aside first)"
        return
    fi
    mkdir -p "$(dirname "$dst")"
    ln -sfn "$src" "$dst"
    log "Linked ~/$2 -> $1"
}

# zsh
link zsh/.zshrc               .zshrc

# tmux
link tmux/.tmux.conf          .tmux.conf

# git
link git/.gitconfig           .gitconfig
link git/.gitignore_global    .config/git/ignore

# vim
link vim/.vimrc               .vimrc
link vim/.vim                 .vim

# ghostty
link ghostty/config           .config/ghostty/config

# starship prompt
link starship/starship.toml   .config/starship.toml

# agent-configs (AI agent rules + skills, submodule) — owns its own deployment.
if [[ -x "$DOTFILES/agent-configs/setup.sh" ]]; then
    "$DOTFILES/agent-configs/setup.sh"
fi

# sublime (macOS only)
if [[ "$OS" == "Darwin" ]]; then
    SUBLIME_USER="$HOME/Library/Application Support/Sublime Text/Packages/User"
    if [[ -e "$DOTFILES/sublime/Preferences.sublime-settings" ]]; then
        mkdir -p "$SUBLIME_USER"
        ln -sfn "$DOTFILES/sublime/Preferences.sublime-settings" "$SUBLIME_USER/Preferences.sublime-settings"
        ln -sfn "$DOTFILES/sublime/Default (OSX).sublime-keymap" "$SUBLIME_USER/Default (OSX).sublime-keymap"
        log "Linked Sublime settings"
    fi
fi

# ----------------------------------------------------------------------------
# vim-plug + plugins
# ----------------------------------------------------------------------------
if command -v vim >/dev/null 2>&1 && [[ -f "$DOTFILES/vim/.vimrc" ]]; then
    VIM_PLUG="$HOME/.vim/autoload/plug.vim"
    if [[ ! -f "$VIM_PLUG" ]]; then
        log "Installing vim-plug"
        curl -fLo "$VIM_PLUG" --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    log "Installing vim plugins"
    vim +PlugInstall +qall
fi

log "Setup complete."
