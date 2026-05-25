# Thin entrypoint — symlinked to ~/.zshrc by bootstrap.sh
# Real config lives in global.zsh (committed) and local.zsh (per-machine, gitignored).

DOTFILES="${DOTFILES:-$HOME/dotfiles}"

source "$DOTFILES/zsh/global.zsh"
[[ -f "$DOTFILES/zsh/local.zsh" ]] && source "$DOTFILES/zsh/local.zsh"
