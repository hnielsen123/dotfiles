# dotfiles


## Essential linux binaries
fzf

zoxide

bat




## Essential adds to .bashrc (when you can't copy you own)

### Add .local/bin to path
export PATH=$PATH:$HOME/.local/bin

### Enable mouse scroll in less:
export LESS="--mouse --wheel-lines=3"

### Set vim as default editor:
export EDITOR="/usr/bin/vim" [may need to double check path based on distro]

### Best ls alias:
alias ls="ls -alhF --color=auto"

### Enable tmux color:
alias tmux="TERM=xterm-256color tmux"

### Init zoxide and alias to cd / cdi:
eval "$(zoxide init --cmd cd bash)" [for bash]

eval "$(zoxide init --cmd cd zsh)" [for zsh]


## Steps for install

sudo apt install bat
sudo apt install fzf
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/hnielsen123/dotfiles.git

cd ~
sudo cp dotfiles/.tmux.conf .
sudo cp dotfiles/.vimrc .

source .bashrc
tmux source .tmux.conf

tmux, Ctrl+b, Shift+i to activate tpm and tmux plugins.



