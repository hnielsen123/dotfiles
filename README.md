# dotfiles


## Essential linux binaries
fzf
zoxide
bat




## Essential adds to .bashrc (when you can't copy you own)

### Init zoxide and alias to cd / cdi:
eval "$(zoxide init --cmd cd bash)" [for bash]

eval "$(zoxide init --cmd cd zsh)" [for zsh]

### Enable mouse scroll in less:
export LESS="--mouse --wheel-lines=3"

### Set vim as default editor:
export EDITOR="/usr/bin/vim" [may need to double check path based on distro]

### Best ls alias:
alias ls="ls -alhF --color=auto"

### Enable tmux color:
alias tmux="TERM=xterm-256color tmux"



