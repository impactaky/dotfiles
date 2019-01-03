export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"
zplug "mollifier/anyframe"
zplug "themes/duellj", from:oh-my-zsh
zplug "peco/peco", from:gh-r, as:command, use:"*linux*amd64*"
#zplug "BurntSushi/ripgrep", from:gh-r, as:command
zplug "takaaki-kasai/git-foresta", as:command, use:git-foresta
zplug "taki4416/echo_previous_output"

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

# zplug load --verbose
zplug load 
