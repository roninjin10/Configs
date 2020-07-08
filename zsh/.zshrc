
#       .o.       oooo   o8o                                        
#      .888.      `888   `"'                                        
#     .8"888.      888  oooo   .oooo.    .oooo.o  .ooooo.   .oooo.o 
#    .8' `888.     888  `888  `P  )88b  d88(  "8 d88' `88b d88(  "8 
#   .88ooo8888.    888   888   .oP"888  `"Y88b.  888ooo888 `"Y88b.  
#  .8'     `888.   888   888  d8(  888  o.  )88b 888    .o o.  )88b 
# o88o     o8888o o888o o888o `Y888""8o 8""888P' `Y8bod8P' 8""888P' 
#
alias zshconfig="vim '${ZDOTDIR}/.zshrc' && source ~/.zshrc"
alias fantasystack="cd ~/Code/FantasyStack"

alias g="git"
alias gs="g status"
alias ga="g add"
alias gc="g commit"
alias gp="g push"
alias gd="g difftool"
alias gr="g pull"
alias gch="g checkout"

alias vim="nvim"
alias vi="nvim"
alias v="nvim"

alias rickroll="curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash"

# oooooooooooo ooooo      ooo oooooo     oooo    oooooo     oooo                     o8o             .o8       oooo                     
# `888'     `8 `888b.     `8'  `888.     .8'      `888.     .8'                      `"'            "888       `888                     
#  888          8 `88b.    8    `888.   .8'        `888.   .8'    .oooo.   oooo d8b oooo   .oooo.    888oooo.   888   .ooooo.   .oooo.o 
#  888oooo8     8   `88b.  8     `888. .8'          `888. .8'    `P  )88b  `888""8P `888  `P  )88b   d88' `88b  888  d88' `88b d88(  "8 
#  888    "     8     `88b.8      `888.8'            `888.8'      .oP"888   888      888   .oP"888   888   888  888  888ooo888 `"Y88b.  
#  888       o  8       `888       `888'              `888'      d8(  888   888      888  d8(  888   888   888  888  888    .o o.  )88b 
# o888ooooood8 o8o        `8        `8'                `8'       `Y888""8o d888b    o888o `Y888""8o  `Y8bod8P' o888o `Y8bod8P' 8""888P' 

export CONFIG_PATH="/Users/williamcory/Code/Configs"
export ZSH="/Users/williamcory/.oh-my-zsh"
export EDITOR=nvim

# ooooooooo.   oooo                          o8o                       
# `888   `Y88. `888                          `"'                       
#  888   .d88'  888  oooo  oooo   .oooooooo oooo  ooo. .oo.    .oooo.o 
#  888ooo88P'   888  `888  `888  888' `88b  `888  `888P"Y88b  d88(  "8 
#  888          888   888   888  888   888   888   888   888  `"Y88b.  
#  888          888   888   888  `88bod8P'   888   888   888  o.  )88b 
# o888o        o888o  `V88V"V8P' `8oooooo.  o888o o888o o888o 8""888P' 
#                                d"     YD                             
#                                "Y88888P'



plugins=(git)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_DISABLE_COMPFIX=true
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#   .oooooo.                          .o88o.  o8o             
#  d8P'  `Y8b                         888 `"  `"'             
# 888           .ooooo.  ooo. .oo.   o888oo  oooo   .oooooooo 
# 888          d88' `88b `888P"Y88b   888    `888  888' `88b  
# 888          888   888  888   888   888     888  888   888  
# `88b    ooo  888   888  888   888   888     888  `88bod8P'  
#  `Y8bood8P'  `Y8bod8P' o888o o888o o888o   o888o `8oooooo.  
#                                                  d"     YD  
#                                                  "Y88888P'

ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"

# additional auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# tab complete dot files
_comp_options+=(globdots)

# vim mode
bindkey -v
KEYTIMEOUT=1
# edit in actual vim buffer with control e
bindkey '^e' edit-command-line
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
