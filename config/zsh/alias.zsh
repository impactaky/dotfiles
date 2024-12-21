alias tmux="tmux -f $DOTFILES/config/tmux/tmux.conf"

export NIX_CONF_DIR="$DOTFILES/config/nix"

export ATUIN_CONFIG_DIR="$DOTFILES/config/atuin"
eval "$(atuin init zsh --disable-up-arrow)"
