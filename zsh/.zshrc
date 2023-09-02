# Users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
case ${UID} in
0)
    LANG=C
 ;;
esac

autoload colors
colors

setopt no_beep

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# use extended glob
setopt extended_glob

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
# setopt nolistbeep


## Keybind configuration
#
# vim like keybind 
#    and something additions
#
bindkey -v
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete
## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"
alias grep="grep --color=auto"

if [ $(where nvim) ]; then
    alias vim="nvim"
    export EDITOR='nvim'
    export MANPAGER="/bin/sh -c \"col -b -x| nvim -R -c 'set ft=man nolist nonu noma' -\""
else
    export EDITOR='vim'
    export MANPAGER="/bin/sh -c \"col -b -x| vim -R -c 'set ft=man nolist nonu noma' -\""
fi


alias -s py='python3'
alias -s rb='ruby'
alias -s xsh='xonsh'

alias ls="ls --color=auto"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias sl="ls"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias rm="trash"

## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

## load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

if [[ ! -o interactive ]]; then
    return
fi

compctl -K _tmuxinator tmuxinator mux

_tmuxinator() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(tmuxinator commands)"
  else
    completions="$(tmuxinator completions ${words[2,-2]})"
  fi

  reply=("${(ps:\n:)completions}")
}

export CMDLINE_COMP_GEN_ZSH_CONFIG_DIR=$HOME/.zsh/cmdline_comp_gen

# zinit
source $HOME/.zsh/zinit_conf.zsh

# ghq
export GOPATH=$HOME/.go
export PATH=$HOME/.go/bin:$PATH
# anyframe
fpath=($HOME/.ghq/github.com/mollifier/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init

zstyle ':chpwd:*' recent-dirs-max 5000
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
bindkey '^f' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch

function anyframe-widget-execute-history-multiline () {
  history -n -r 1 \
    | anyframe-selector-auto \
    | sed 's/\\\\n/\n/g' \
    | anyframe-action-execute
}
zle -N anyframe-widget-execute-history-multiline
bindkey '^r' anyframe-widget-execute-history-multiline

function anyframe-widget-favorite-history () {
  history -n -r 1 \
    | anyframe-selector-auto \
    | sed 's/\\\\n/\n/g' \
    >> $MY_PRIVATE_DIR/history
}
zle -N anyframe-widget-favorite-history
bindkey '^o' anyframe-widget-favorite-history

function anyframe-widget-vim-runcommand () {
  history -n -r 1 \
    | anyframe-selector-auto \
    | sed 's/\\\\n/\n/g' \
    > .run_command.sh
}
zle -N anyframe-widget-vim-runcommand
bindkey '^v' anyframe-widget-vim-runcommand

bindkey '^xi' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history

bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xe' anyframe-widget-insert-git-branch
bindkey '^x^e' anyframe-widget-insert-git-branch

export MANPAGER="/bin/sh -c \"col -b -x| nvim -R -c 'set ft=man nolist nonu noma' -\""

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# source ~/.tmuxinator/tmuxinator.zsh

alias dhnrun='docker run --rm -it --net=host --group-add=sudo --user=$(id -u):$(id -g) --volume=/etc/group:/etc/group:ro --volume=/etc/passwd:/etc/passwd:ro --volume=/etc/shadow:/etc/shadow:ro -v=$HOME:$HOME -v=/mnt:/mnt -v=$HOME/Documents:$HOME/Documents -v=$HOME/office:$HOME/office -v=/mnt:/mnt --workdir=$(pwd)'
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias dhrun='docker run --rm -it --net=host --group-add=sudo --user=$(id -u):$(id -g) --volume=/etc/group:/etc/group:ro --volume=/etc/passwd:/etc/passwd:ro --volume=/etc/shadow:/etc/shadow:ro -v=$HOME/x86_64_home:/home/$USER.linux -v=/mnt:/mnt -v=$HOME/Documents:$HOME/Documents -v=$HOME/office:$HOME/office -v=/mnt:/mnt --workdir=$(pwd)'
else
    alias dhrun='docker run --rm -it --net=host --group-add=sudo --user=$(id -u):$(id -g) --volume=/etc/group:/etc/group:ro --volume=/etc/passwd:/etc/passwd:ro --volume=/etc/shadow:/etc/shadow:ro -v=$HOME/x86_64_home:$HOME -v=/mnt:/mnt -v=$HOME/Documents:$HOME/Documents -v=$HOME/office:$HOME/office -v=/mnt:/mnt --workdir=$(pwd)'
fi
alias dhcrun='docker run --rm -it --net=host --group-add=sudo --user=$(id -u):$(id -g) --volume=/etc/group:/etc/group:ro --volume=/etc/passwd:/etc/passwd:ro --volume=/etc/shadow:/etc/shadow:ro -v=$HOME/aarch64_home:$HOME -v=$HOME/Documents:$HOME/Documents -v=$HOME/office:$HOME/office -v=/mnt:/mnt --workdir=$(pwd)'
alias dhrun_armhf='docker run --rm -it --net=host --group-add=sudo --user=$(id -u):$(id -g) --volume=/etc/group:/etc/group:ro --volume=/etc/passwd:/etc/passwd:ro --volume=/etc/shadow:/etc/shadow:ro -v=$HOME/armhf:$HOME -v=$HOME/Documents:$HOME/Documents -v=$HOME/office:$HOME/office -v=/mnt:/mnt --workdir=$(pwd)'
dob () { docker build --target $1 -t localhost:5000/$1 ${@:2} }

# echo_previous_outpt
PromptCmdLinePattern="${HOST%%.*}"
Prompt2Pattern="\\$ "
PromptLines=1
SearchLines=1000
alias epo="echo_previous_output"
alias epon='echo_previous_output | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'
function put_epo(){
	echo "epo | " | anyframe-action-put
}
zle -N put_epo
bindkey '^e' put_epo

if type rustup &> /dev/null ; then
	export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi

export PATH=$HOME/bin:$HOME/.go/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# useful_ssh-agent.zsh
alias setup_ssh=check_ssh-agent_and_execute
alias ssh='check_ssh-agent_and_execute && ssh'
alias scp='check_ssh-agent_and_execute && scp'
alias rsync='check_ssh-agent_and_execute && rsync'
alias sshfs='check_ssh-agent_and_execute && sshfs'

fuction notify_to_tmux_window_name () {
    tmux list-windows -a -F "#{pane_pid} #{window_id}" \
        | grep $$ \
        | cut -d ' ' -f 2 \
        | xargs -I {} tmux rename-window -t {} !!!!!!!!
    read -k 1 key"?Press any key to return console: "
    tmux setw automatic-rename
}

alias N="notify_to_tmux_window_name"
alias cmake="cmake -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_EXPORT_COMPILE_COMMANDS=1"

function latest () {
    ls -t $@ | head -n 1
}

function seps () {
    sed 's/[\t ]\+/\t/g' | cut $@
}

function vp () {
    ex -s "$@" +%p +q! /dev/stdin
}

eval "$(direnv hook zsh)"
if [ -e $HOME/.zsh/local.zshrc ]; then
	source $HOME/.zsh/local.zshrc
fi

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

zmodload zsh/zpty

RED=%B%{$fg[red]%}
BLUE=%B%{$fg[blue]%}
WHITE=%{$fg[white]%}
GREEN=%{$fg[green]%}
RESET=%{$reset_color%}

ZSH_GIT_PROMPT_SHOW_UPSTREA="no"
ZSH_GIT_PROMPT_NO_ASYNC=1

ZSH_THEME_GIT_PROMPT_PREFIX=" - ["
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✘"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="."
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

function prompt-length() {
  emulate -L zsh
  local -i COLUMNS=${2:-COLUMNS}
  local -i x y=${#1} m
  if (( y )); then
    while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
      x=y
      (( y *= 2 ))
    done
    while (( y > x + 1 )); do
      (( m = x + (y - x) / 2 ))
      (( ${${(%):-$1%$m(l.x.y)}[-1]} = m ))
    done
  fi
  typeset -g REPLY=$x
}

precmd() {
    local ret=$?
    if [[ ret -eq 0 ]]; then
        local BASE="${BLUE}"
    else
        local BASE="${RED}"
    fi
    ZSH_THEME_GIT_PROMPT_SUFFIX="${BASE}]"
    # local gitprompt=$(_zsh_git_prompt_git_status)
    local gitprompt=""
    local dockerprompt=""
    if [[ -f /.dockerenv ]]; then
        dockerprompt=" - [${GREEN}in Docker${BASE}]"
    fi
    local left="$BASE""[$GREEN%m$BASE]$dockerprompt - [$WHITE%~${BASE}]$gitprompt${BASE}"
    # local right="$BLUE""[%b$WHITE%?$BLUE] - [%b$WHITE%D{%H:%M:%S}$BLUE]"
    local right="${BASE}""[%b$WHITE%D{%H:%M:%S}${BASE}]"
    prompt-length $left
    local -i left_len=REPLY
    prompt-length $right
    local -i right_len=REPLY
    PROMPT=$left${(r:($COLUMNS-$left_len-$right_len):: :)}$right
    PROMPT+=%{$fg[magenta]%}$'\n'"$ $RESET"
}
RPROMPT=""
