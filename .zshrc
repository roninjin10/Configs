if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###
###
### ALIASES
### 
###

alias zshconfig="vim ~/.zshrc && source ~/.zshrc"

alias g="git"
alias gs="g status"
alias ga="g add"
alias gc="g commit"
alias gcm="g commit -m"
alias gcam="g commit -a -m"
alias gch="g checkout"
alias gchb="ch -b"

###
###
### CONFIG
### 
###

export ZSH="/Users/williamcory/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

###
###
### PLUGINS
### 
###

plugins=(git)

###
###
### STARTUP
###
###

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
