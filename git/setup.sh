DOT_DIR=${DOT_DIR:-$HOME/dotfiles}
ln -s $DOT_DIR/git/.gitignore_global $HOME/.gitignore_global
echo '
[diff]
    tool = nvimdiff
[difftool "nvimdiff"]
    cmd = "nvim -R -d -c \"wincmd l\" -d \"$LOCAL\" \"$REMOTE\""
[mergetool "nvimdiff"]
    cmd = "nvim -d -c \"4wincmd w | wincmd J\" \"$LOCAL\" \"$BASE\" \"$REMOTE\"  \"$MERGED\""
[merge]
    tool = nvimdiff
    conflictstyle = diff3
' >> $HOME/.gitconfig
