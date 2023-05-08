# dotfiles
my configs files

# Setup for store dotfiles
<code>
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
</code>
Installation/migration under https://www.atlassian.com/git/tutorials/dotfiles
