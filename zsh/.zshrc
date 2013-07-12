autoload -U compinit
compinit
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
plugins=(zsh-syntax-highlighting)
setopt NO_BEEP
source $ZSH/oh-my-zsh.sh
source /usr/local/opt/autoenv/activate.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin
DEFAULT_USER=yutongpei
alias st2='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim'

# for 15-410

alias -g 410p3='~/Code/15-410/p3/'
alias -g 410p4='~/Code/15-410/p4/'
alias -g rmu='~/Code/RaiseMeUp/'

export VISUAL=mvim
export EDITOR=$VISUAL


# Set to shortest possible delay is 1/100 second.
# This allows escape sequences like cursor/arrow keys to work,
# while eliminating the delay exiting vi insert mode.
KEYTIMEOUT=1

setopt AUTO_CD

setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME

# Try to correct command line spelling
setopt CORRECT CORRECT_ALL

# ignore duplicate history entries
setopt histignoredups

setopt ALWAYS_TO_END

autoload zmv

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#bindkey -v
## add some readline keys back
#bindkey "^A" beginning-of-line

#bindkey "^E" end-of-line
## use incremental search
#bindkey "^R" history-incremental-search-backward

#bindkey -M vicmd '^R' history-incremental-search-backward

#bindkey -M viins '^p'    up-line-or-history
#bindkey -M viins '^n'    down-line-or-history
#bindkey -M viins '^_'    undo

#bindkey -M vicmd '^p'    up-line-or-history
#bindkey -M vicmd '^n'    down-line-or-history
#bindkey -M vicmd '^_'    undo
#bindkey -M viins '\ef'   forward-word      # Alt-f
#bindkey -M viins '\eb'   backward-word     # Alt-b
#bindkey -M viins '\ed'   kill-word         # Alt-d 


#vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
#vim_cmd_mode="%{$fg[green]%}[CMD]%{$reset_color%}"
#vim_mode=$vim_ins_mode

#function zle-keymap-select {
  #vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  #zle reset-prompt
#}
#zle -N zle-keymap-select

#function zle-line-finish {
  #vim_mode=$vim_ins_mode
#}
#zle -N zle-line-finish

#RPROMPT='${vim_mode}'
