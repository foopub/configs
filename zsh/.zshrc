# Add directories to the $PATH here
export PATH=$HOME/.local/bin:$PATH

# Change default umask
umask 027

# Path to your oh-my-zsh installation.
export ZSH="/usr/share/oh-my-zsh"

# Pretty stuff
ZSH_THEME="agnoster"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Source my dircolors if available
if [[ -f /etc/dircolors ]]; then
  source /etc/dircolors
fi

# Plugins 
plugins=(
  git
  vi-mode
)

# Local completion script dir
fpath+=$XDG_CONFIG_HOME/zsh/.zfunc
source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Create cache dir if it doesn't exist
ZSH_CACHE_DIR=~/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
HISTFILE=$ZSH_CACHE_DIR/zsh-history

## Aliases

# Keeping things clean
alias wget='wget --hsts-file ~/.cache/wget/wget-hsts'
alias nvidia-settings='nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings'

# Default settings
alias nf='neofetch --ascii_colors 6 15 --colors 9 5 3 4 5 13'
alias chrom='chromium --force-dark-mode > /dev/null 2>&1 & disown'

# RC files
alias rcz='nvim ~/.config/zsh/.zshrc'
alias rcv='nvim ~/.config/nvim/init.vim'
alias rcs='nvim ~/.config/sway/config '
alias rci='nvim ~/.config/i3/config '

# Python stuff
#alias conda='unalias conda && source /home/foo/Progs/miniforge3/bin/activate'
#alias sourchf='source ~/Projects/HF/bin/activate'

#Vim mode additional binds
# start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
# start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
