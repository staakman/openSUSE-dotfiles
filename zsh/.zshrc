# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Starship
eval "$(starship init zsh)"

# auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# FZF colors
export FZF_DEFAULT_OPTS='
  --color=bg:#282a36,fg:#f8f8f2,hl:#ff79c6
  --color=bg+:#44475a,fg+:#f8f8f2,hl+:#ff79c6
  --color=info:#8be9fd,prompt:#ffb86c,pointer:#bd93f9
  --color=marker:#50fa7b,spinner:#ff5555,header:#6272a4
'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

