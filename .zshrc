# preserves current working directory!!! hardcoded, because /etc/profile.d/vte.sh not founded
. /etc/profile.d/vte-2.91.sh

export SHELL=/bin/bash
# export TERM=screen-256color
# if [ "$TMUX" = "" ]; then 
#     tmux -2
#     # update vim config at startup
#     nvim +PlugUpdate +qall
# fi
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PROXYPASS="PASS_HERE"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git github git-extras laravel command-not-found history-substring-search cp history)

source $ZSH/oh-my-zsh.sh

# User configuration
# now is enabled by default: this seems to untoggle autopushd ??!!
# setopt autopushd

export PATH="$HOME/bin:$HOME/bin/untrackedfiles:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# load my alias functions file
. $HOME/.alias_functions

# local only aliases
alias clswap='mv ~/.vimswap/*.swp ~/.vimswap/kk'
alias md='ln -fs ~/.config/mpv/config_digital ~/.config/mpv/mpv.conf; '
alias ma='ln -fs ~/.config/mpv/config_analog ~/.config/mpv/mpv.conf; '
alias m='pli -s -d 2'
alias h='pli -s -d 1'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# free <C-S> so we can use it in vim
stty -ixon -ixoff

# vi mappings
bindkey -v
# C-S instead of ESC to enter Vi normal mode
bindkey '^S' vi-cmd-mode

## some standard bash keys so we can use it with vim mappings enabled
# navigation
bindkey '^[b' backward-word
bindkey '^[f' forward-word
# delete from cursor to beginning of line
bindkey '^U' backward-kill-line
# delete from cursor to end of line
bindkey '^K' kill-line
# delete previous word
bindkey '^w' backward-kill-word
# delete next word
bindkey '^[d' kill-word
# backspace
bindkey '^h' backward-delete-char
# uppercase word starting from cursor
bindkey '^[u' up-case-word
# we keep up-history and down-history bindings for the plugin history-substring-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
# go to beginning of line (^A is used by tmux)
bindkey '^B' beginning-of-line
# go to end of line
bindkey '^E' end-of-line
# incremental search backward
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[red]%} [% VIMODE]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# export http_proxy="http://$USER:$PROXYPASS@server:111"
# export https_proxy="http://$USER:$PROXYPASS@server:111"
# export ftp_proxy="http://$USER:$PROXYPASS@server:111"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"


# doesnt show .gitignore, but yes hidden files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# doesnt show .gitignore nor hidden files
# export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
