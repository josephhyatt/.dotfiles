#
# Tmux
#

if [ -z "$TMUX" ] # When zsh is started attach to current tmux session or create a new one
then
    tmux attach -t TMUX || tmux new -s TMUX
fi

#
# vim
#

export EDITOR="vim"
alias vim="vim"

#
# Oh-my-zsh
#

export ZSH="$HOME/.oh-my-zsh"

SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true # Show prefix before first line in prompt
ZSH_THEME="spaceship" # Set theme

plugins=(
  # git # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
  history-substring-search # ZSH port of Fish history search. Begin typing command, use up arrow to select previous use
  zsh-autosuggestions # Suggests commands based on your history
  zsh-completions # More completions
  zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
  colored-man-pages # Self-explanatory
  sudo # adds sudo to front of text by double pressing Esc
  history-substring-search
  )
autoload -U compinit && compinit # reload completions for zsh-completions

source $ZSH/oh-my-zsh.sh # required

source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # required
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Colorize autosuggest
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

#
# Spaceship-prompt
#

# Spaceship-prompt customization
SPACESHIP_PROMPT_ORDER=(
dir             # Current directory section
user            # Username section
host            # Hostname section
git             # Git section (git_branch + git_status)
time          # Time stampts section
# hg            # Mercurial section (hg_branch  + hg_status)
# package       # Package version
node          # Node.js section
ruby          # Ruby section
# elixir        # Elixir section
# xcode         # Xcode section
# swift         # Swift section
# golang        # Go section
# php           # PHP section
# rust          # Rust section
# haskell       # Haskell Stack section
# julia         # Julia section
# docker        # Docker section
# aws           # Amazon Web Services section
venv          # virtualenv section
# conda         # conda virtualenv section
pyenv         # Pyenv section
# dotnet        # .NET section
# ember         # Ember.js section
# kubecontext   # Kubectl context section
exec_time       # Execution time
line_sep        # Line break
battery         # Battery level and status
vi_mode         # Vi-mode indicator
jobs            # Background jobs indicator
# exit_code     # Exit code section
char            # Prompt character
)

SPACESHIP_DIR_PREFIX="%{$fg[blue]%}┌─[%b "
SPACESHIP_DIR_SUFFIX="%{$fg[blue]%} ] "
SPACESHIP_CHAR_SYMBOL="%{$fg[blue]%}└─▪%b "

#
# Other
#

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
export PATH="/Users/jh/.gem/ruby/2.5.0/bin:$PATH"

export PATH="$HOME/bin:$PATH"
## Load Aliases
[[ -f ~/.aliases ]] && . ~/.aliases

eval $(thefuck --alias)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm

# zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# rbenv/rails
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# Linux Homebrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# zsh-history-substring-search
source ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jh/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jh/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jh/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<