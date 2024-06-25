# dotfiles


## Essential linux binaries
fzf

zoxide

bat

## Install NerdFont 

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip (might change as it gets updated)

mkdir FiraCode

unzip ./FiraCode.zip -d ./FiraCode/

sudo mv ./FiraCode/* /usr/local/share/fonts

fc-cache -f -v

#### In Windows Terminal, this seems to work automatically after this. In Kali, you need to:

vim ~/.config/qterminal.org/qterminal.ini

Change `fontFamily` from `FiraCode`/`Fira Code` to `FiraCode Nerd Font`, then in qterminal settings change the font to FiraCode Nerd Font


## Essential adds to .bashrc/.zshrc (when you can't copy your own)

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

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash [for bash]

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | zsh [for zsh]


cd ~


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/hnielsen123/dotfiles.git




sudo cp dotfiles/.tmux.conf .

sudo cp dotfiles/.vimrc .


source .bashrc [for bash]

source .zshrc [for zsh]

tmux source .tmux.conf


tmux, Ctrl+b, Shift+i to activate tpm and tmux plugins.

If: vim sorbet theme not installed and/or vim line highlighting doesn't work, comment out relevant line(s) in .vimrc

Add (hostname) to the "status left" part of ~/.tmux/plugins/tokyo-night-tmux/tokyo-night.tmux






