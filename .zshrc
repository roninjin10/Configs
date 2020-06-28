###
###
### ALIASES
### 
###

alias zshconfig="vim '${CONFIG_PATH}/.zshrc' && '${CONFIG_PATH}/configUpdate' && source ~/.zshrc"

alias g="git"
alias gs="g status"
alias ga="g add"
alias gc="g commit"
alias gch="g checkout"

alias cdConfig="cd \"${CONFIG_PATH}\""

###
###
### ENV Variables
### 
###

export CONFIG_PATH="/Users/williamcory/Code/Configs"
export ZSH="/Users/williamcory/.oh-my-zsh"

###
###
### CONFIG
### 
###

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

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
