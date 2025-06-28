# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

# Auto-completion
zstyle :compinstall filename '/home/staakman/.zshrc'
autoload -Uz compinit
compinit

# Starship
eval "$(starship init zsh)"

