ZSH_CACHE_DIR=~/.cache/zsh      
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

if [[ -f /etc/dircolors ]]; then
  source /etc/dircolors
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/histfile
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_IGNORE_DUPS

setopt autocd autopushd extendedglob notify
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install

export FZF_COMPLETION_TRIGGER='~~'
source /usr/share/zsh/plugins/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/fzf/completion.zsh

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 'NUMERIC == 3'
zstyle ':completion:*' glob 'NUMERIC == 2'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' prompt 'arst %e >'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle :compinstall filename '/home/foo/.config/zsh/.zshrc'

fpath+=$XDG_CONFIG_HOME/zsh/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.pyenv/bin:$PATH
. "$HOME/.cargo/env"

umask 027

export EDITOR='nvim'
export PAGER='less'
export BAT_PAGER=''
export READNULLCMD='bat'

eval "$(starship init zsh)"

#alias wget='wget --hsts-file ~/.cache/wget/wget-hsts'
# Default settings
alias nf='neofetch --ascii_colors 6 15 --colors 9 5 3 4 5 13'
alias chrom='chromium-browser --force-dark-mode --ozone-platform-hint=wayland > /dev/null 2>&1 & disown'
alias freecad='QT_QPA_PLATFORM=xcb FreeCAD' #need to use X backend 
alias l='exa -l'
alias la='exa -la'
alias ls='exa'

# RC files
alias rcz='nvim ~/.config/zsh/.zshrc'
alias rcv='nvim ~/.config/nvim/init.vim'
alias rcs='nvim ~/.config/sway/config '
alias rci='nvim ~/.config/i3/config '

#_test_cmd() {
#    printf "test"
#}
#zle -N _test_cmd
#bindkey '^[[A' _test_cmd 

# "${terminfo[kcuu1]}" can be wrong, cat -v or showkeys -a is right

# start typing + [Up-Arrow] - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search

# start typing + [Down-Arrow] - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

alias luamake=/home/foo/Progs/lua-language-server/3rd/luamake/luamake

# TODO
# fzf common directories
# sudo edit
