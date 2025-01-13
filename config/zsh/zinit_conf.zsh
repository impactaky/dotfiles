ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
unalias zi

zinit ice atload"zicompinit"
zinit ice compile'{*.zsh,^_*},!(<->N)'
zinit light impactaky/cmdline_comp_gen.zsh
zinit light impactaky/echo_previous_output
zinit light impactaky/useful_ssh-agent.zsh
zinit light impactaky/durun.zsh
zinit light woefe/git-prompt.zsh
zinit ice as"program"
zinit light "impactaky/code_for_another_session"

# These package install homebrew in macOS
if [[ "$(uname -s)" != "Darwin" ]]; then
  zinit ice from"gh-r" as"program" mv"hadolint* -> hadolint"
  zinit light hadolint/hadolint
fi
