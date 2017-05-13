autoload -Uz compinit
compinit

# General Configs
export TERM="xterm-256color" 

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


antigen bundle command-not-found
#antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
#antigen bundle npm
#antigen bundle web-search
antigen bundle z
antigen bundle zsh-users/zaw
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search


#antigen theme agnoster
antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

# Keybindings
#"^[[A" up-line-or-history
#"^[[B" down-line-or-history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' zaw-history
bindkey -M filterselect '^D' zaw-bookmark-add-buffer
#bindkey -M filterselect '^R' down-line-or-history
#bindkey -M filterselect '^S' up-line-or-history

# ZAW UI
zstyle ':filter-select:highlight' matched fg=green
zstyle ':filter-select' max-lines 5

# ZSH Configs
# activate menu selection
zstyle ':completion:*' menu select
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

#Lastly, to prevent duplicate commands in the history file, set histignoredups:
setopt histignoredups

# Set default user
DEFAULT_USER="hirad"

# If you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# Allows you to type Bash style comments on your command line
setopt interactivecomments

# Zsh has a spelling corrector
setopt CORRECT

