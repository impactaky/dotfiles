source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light mollifier/anyframe
zinit snippet OMZT::duellj
zinit ice from"gh-r" as"program" pick"*/peco"
zinit light peco/peco
zinit ice from"gh-r" as"program" mv"ripgrep*/rg -> ripgrep"
zinit light BurntSushi/ripgrep
zinit ice as"program" pick"git-foresta"
zinit light takaaki-kasai/git-foresta
zinit light impactaky/cmdline_comp_gen.zsh
zinit light impactaky/echo_previous_output
zinit light impactaky/useful_ssh-agent.zsh
