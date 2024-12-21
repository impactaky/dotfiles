source $DOTFILES/result/share/zinit/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light mollifier/anyframe
zinit ice from"gh-r" as"program" pick"*/peco"
zinit light peco/peco
zinit ice from"gh-r" as"program" mv"ripgrep*/rg -> ripgrep"
zinit light BurntSushi/ripgrep
zinit ice as"program" pick"git-foresta"
zinit light takaaki-kasai/git-foresta
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
