# dotfiles


## Essential linux binaries
fzf

zoxide

bat

starship

rg (ripgrep)

## Steps for install

### 1. Install NerdFont (for headless machines this is only necessary on the host, not the machine you're SSHing into)

#### For Linux (WSL or VM)
```bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraCode.zip
```
(might change as it gets updated)

```bash
mkdir FiraCode
```

```bash
unzip ./FiraCode.zip -d ./FiraCode/
```

```bash
sudo mv ./FiraCode/* /usr/local/share/fonts
```

```bash
fc-cache -f -v
```

For Kali (not sure if necessary in Ubuntu VM/WSL):

```bash
vim ~/.config/qterminal.org/qterminal.ini
```

Change `fontFamily` from `FiraCode`/`Fira Code` to `FiraCode Nerd Font`, then in qterminal settings change the font to FiraCode Nerd Font

#### For Windows (Powershell + SSH into linux machines from Windows)
```
https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaMono.zip
```

Unzip, copy to C:\Windows\Fonts

Change in Windows Terminal -> Settings -> Defaults -> Font face to Caskaydia Nerd Font Mono


### 2. Install and configure binaries 

```bash
sudo apt install bat fzf ripgrep
```

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

```bash
curl -sS https://starship.rs/install.sh | sh
```


```bash
cd ~
```


```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

```bash
git clone https://github.com/hnielsen123/dotfiles.git
```


```bash
cp dotfiles/.tmux.conf .
```

```bash
cp dotfiles/.vimrc .
```

```bash
cp -R dotfiles/.config .
```

### 3. Add the following to .zshrc / .bashrc


#### Optional: Enable Vim keybinds in shell prompt (I don't actually like this very much)

[for bash]
```bash
set -o vi
```

[for zsh]

change `bindkey -e` to `bindkey -v`

#### Best ls alias:
```bash
alias ls="ls -alhF --color=auto"
```

#### Optional: Alias for message of the day (Ubuntu only)
```bash
alias motd="cat /run/motd.dynamic"
```

#### Add .local/bin to path
```bash
export PATH=$PATH:$HOME/.local/bin
```

#### Enable mouse scroll in less:
```bash
export LESS="-iRM --mouse --wheel-lines=3"
```

#### Set vim as default editor:
```bash
export EDITOR="/usr/bin/vim"
```
[may need to double check path based on distro]


#### Init starship
[for bash]
```bash
eval "$(starship init bash)" 
```

[for zsh]
```bash
eval "$(starship init zsh)" 
```

#### Init zoxide and alias to cd / cdi:
[for bash]
```bash
eval "$(zoxide init --cmd cd bash)"
```

[for zsh]
```
eval "$(zoxide init --cmd cd zsh)"
```

#### Optional: auto-start tmux over SSH (last thing in .bashrc):
```bash
# prints MOTD because I like it
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  motd_cmd='[ -r /run/motd.dynamic ] && cat /run/motd.dynamic; [ -r /etc/motd ] && cat /etc/motd'
  tmux has-session -t 0 2>/dev/null \
    && exec tmux attach -t 0 \
    || exec tmux new -s 0 "$motd_cmd; echo; exec \$SHELL -l"
fi

# if you'd prefer no MOTD
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  tmux has-session -t 0 2>/dev/null \
    && exec tmux attach -t 0 \
    || exec tmux new -s 0
fi
```

For local installations (VM/WSL2) where you still want to auto start tmux:
```bash
if [[ $- =~ i ]] && [[ -z "$TMUX" ]]; then
        tmux attach-session -t 0 || tmux new-session -s 0
fi
```

#### Example full addition to .bashrc: (Ubuntu server)
```bash
alias ls="ls -alhF --color=auto"
alias motd="cat /run/motd.dynamic"

export PATH=$PATH:$HOME/.local/bin
export LESS="-iRM --mouse --wheel-lines=3"
export EDITOR="/usr/bin/vim"

eval "$(starship init bash)" 
eval "$(zoxide init --cmd cd bash)"

if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  motd_cmd='[ -r /run/motd.dynamic ] && cat /run/motd.dynamic; [ -r /etc/motd ] && cat /etc/motd'
  tmux has-session -t 0 2>/dev/null \
    && exec tmux attach -t 0 \
    || exec tmux new -s 0 "$motd_cmd; echo; exec \$SHELL -l"
fi
```

#### Put changes into effect
[for bash]
```bash
source .bashrc
```

[for zsh] 
```bash
source .zshrc
```

#### Nice to haves for root (for anytime you need to sudo su)
```bash
echo -e '\nalias ls="ls -alhF --color=auto"' | sudo tee -a /root/.bashrc > /dev/null
```
```bash
echo -e '\nexport LESS="-iRM --mouse --wheel-lines=3"' | sudo tee -a /root/.bashrc > /dev/null
```
```bash
echo 'export EDITOR="/usr/bin/vim"' | sudo tee -a /root/.bashrc > /dev/null
```
```bash
sudo cp ~/dotfiles/.vimrc /root/
```

### 4. Configure tmux
  
```bash
tmux
```

```bash
tmux source .tmux.conf
```

`Ctrl+b`, `Shift+i` to activate tpm and tmux plugins.

Comment out the "status left" part of `~/.tmux/plugins/tokyo-night-tmux/tokyo-night.tmux`, instead add
```bash
tmux set -g status-left "#[fg=${THEME[foreground]},bg=${THEME[black]}] #{?client_prefix,󰠠 ,#[dim]󰤂 }#[nodim]#(hostname) "
```

Then, right below that, comment out the "window-status-current-format line, and instead add
```bash
tmux set -g window-status-current-format "$RESET#[fg=${THEME[foreground]},bg=${THEME[bblack]}] #{?#{==:#{pane_current_command},ssh},󰣀 ,$active_terminal_icon $window_space}#[fg=${THEME[foreground]},bold,nodim]$window_number#W#[nobold]#{?window_zoomed_flag, $zoom_number, $custom_pane}#{?window_last_flag, , }"
```

In `~/.tmux/plugins/tokyo-night-tmux/src/themes.sh`, go the the default/night theme at the bottom and change `["foreground"]="#a9b1d6"` to `["foreground"]="#f2f2f2"`

Exit tmux, then `tmux` to start a new session and make sure everything is initiated correctly (if you're using auto disconnect SSH on tmux detach, you'll need to `tmux source ~/.tmux.conf` instead)

### 5. Optional installs

#### lsd - better ls

Install on Debian-based:
- Download installer (current link, check for newer release at https://github.com/lsd-rs/lsd/releases):
```bash
wget https://github.com/lsd-rs/lsd/releases/download/v1.2.0/lsd_1.2.0_amd64.deb
```
- Install
```bash
sudo apt install ./lsd_1.2.0_amd64.deb
```
Install on Arch:
```bash
sudo pacman -S lsd
```
Configure:
- Copy config from dotfile repo
```bash
cp -R ~/dotfiles/.config/lsd ~/.config
```
- Add aliases to .bashrc/.zshrc
```bash
alias ls='lsd -la'
alias ll='lsd -l'
alias lt='lsd -la --tree --depth 2'
alias llt='lsd -l --tree --depth 2'
```

#### fd - better find

Install on Ubuntu:
- Download installer (current link, check for newer release at (https://github.com/sharkdp/fd/releases)
```bash
wget https://github.com/sharkdp/fd/releases/download/v10.3.0/fd_10.3.0_amd64.deb
```
- Install
```bash
sudo apt install ./fd_10.3.0_amd64.deb
```
Install on Kali:
```bash
sudo apt install fd-find
```
```bash
ln -s $(which fdfind) ~/.local/bin/fd
```
Install on Arch:
```bash
sudo pacman -S fd
```
