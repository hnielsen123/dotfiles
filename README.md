# dotfiles


## Essential linux binaries
fzf

zoxide

bat

starship

## Steps for install

### 1. Install NerdFont (for headless machines this is only necessary on the host, not the machine you're SSHing into)

#### For Linux (WSL or VM)
`wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip` (might change as it gets updated)

`mkdir FiraCode`

`unzip ./FiraCode.zip -d ./FiraCode/`

`sudo mv ./FiraCode/* /usr/local/share/fonts`

`fc-cache -f -v`

For Kali (not sure if necessary in Ubuntu VM/WSL):

`vim ~/.config/qterminal.org/qterminal.ini`

Change `fontFamily` from `FiraCode`/`Fira Code` to `FiraCode Nerd Font`, then in qterminal settings change the font to FiraCode Nerd Font

#### For Windows (Powershell + SSH into linux machines from Windows)

https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaMono.zip

Unzip, copy to C:\Windows\Fonts

Change in Windows Terminal -> Settings -> Defaults -> Font face to Caskaydia Nerd Font Mono


### 2. Install and configure binaries 

`sudo apt install bat`

`sudo apt install fzf`

`curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh`

`curl -sS https://starship.rs/install.sh | sh`


`cd ~`


`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

`git clone https://github.com/hnielsen123/dotfiles.git`




`sudo cp dotfiles/.tmux.conf .`

`sudo cp dotfiles/.vimrc .`

`sudo cp -R dotfiles/.config .`

### 3. Add the following to .zshrc / .bashrc

#### Enable Vim keybinds in shell prompt (optional)

set -o vi [for bash]

change `bindkey -e` to `bindkey -v` [for zsh]

#### Add .local/bin to path
export PATH=$PATH:$HOME/.local/bin

#### Enable mouse scroll in less:
export LESS="--mouse --wheel-lines=3"

#### Set vim as default editor:
export EDITOR="/usr/bin/vim" [may need to double check path based on distro]

#### Best ls alias:
alias ls="ls -alhF --color=auto"

#### Enable tmux color:
alias tmux="TERM=xterm-256color tmux"

#### Init zoxide and alias to cd / cdi:
eval "$(zoxide init --cmd cd bash)" [for bash]

eval "$(zoxide init --cmd cd zsh)" [for zsh]

#### Init starship

eval "$(starship init bash)" [for bash]

eval "$(starship init zsh)" [for zsh]

#### Put changes into effect
`source .bashrc` [for bash]

`source .zshrc` [for zsh]

### 4. Configure tmux

`tmux`

`tmux source .tmux.conf`

Ctrl+b, Shift+i to activate tpm and tmux plugins.

Exit tmux, then `tmux` to start a new session and make sure everything is initiated correctly

If: vim sorbet theme not installed and/or vim line highlighting doesn't work, comment out relevant line(s) in .vimrc

Add (hostname) to the "status left" part of ~/.tmux/plugins/tokyo-night-tmux/tokyo-night.tmux (change `#S$hostname` to `#(hostname)`






