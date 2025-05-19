ZSH_CACHE_DIR=~/.cache/zsh      
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# These are in zshenv but keep a copy here
export LANG=en_GB.UTF-8

export PATH=$HOME/.local/bin:$PATH
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export PATH=$PYENV_ROOT/bin:$PATH

if [[ -f /etc/dircolors ]]; then
  source /etc/dircolors
fi

umask 027

export EDITOR='nvim'
export PAGER='less'
export BAT_PAGER=''
export READNULLCMD='bat'

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_IGNORE_DUPS
setopt sharehistory

setopt autocd autopushd extendedglob notify
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 'NUMERIC == 3'
zstyle ':completion:*' glob 'NUMERIC == 2'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' prompt 'arst %e >'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename "/home/${USER}/.config/zsh/.zshrc"

fpath=(~/.nix-profile/share/zsh/site-functions
	$XDG_CONFIG_HOME/zsh/.zfunc
	$fpath)

autoload -Uz compinit
compinit
# End of lines added by compinstall


if [ -x $(command -v fzf) ]; then
  export FZF_COMPLETION_TRIGGER='#'
  source <(fzf --zsh)
fi

if [ -x $(command -v starship) ]; then
  eval "$(starship init zsh)"
fi

if [ -x $(command -v zoxide) ]; then
  eval "$(zoxide init zsh)"
fi

# Default settings
alias wget='wget --hsts-file ~/.cache/wget/wget-hsts'
alias nf='neofetch --ascii_colors 6 15 --colors 9 5 3 4 5 13'
alias l='eza -l --group-directories-first'
alias la='l -aa'
alias ls='eza'

# RC files
alias rcz='nvim ~/.config/zsh/.zshrc'
alias rcv='nvim ~/.config/nvim/init.vim'
alias rcs='nvim ~/.config/sway/config '
alias rci='nvim ~/.config/i3/config'
alias rct='nvim ~/.config/tmux/tmux.conf'
alias rcn='sudo nvim /etc/nixos/configuration.nix'

# "${terminfo[kcuu1]}" can be wrong, cat -v or showkeys -a is right
# Bind both arrows and page up/dn as arrows alone don't seem to work
# in some environments

# start typing + [Up-Arrow]/PgUp - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[5~' up-line-or-beginning-search

# start typing + [Down-Arrow]/PgDn - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^[[6~' up-line-or-beginning-search

# Man will automatically search and find docs for a given binary, given that
# they're placed in the correct realative path to the bin, i.e. ../share/man.
# By default $MANPATH is often stupidly set to the system paths which is both
# redundant and PREVENTS man auto search
unset MANPATH
