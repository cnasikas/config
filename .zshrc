# If you come from bash you might have to change your $PATH.
export PATH=/usr/bin:/usr/local/bin:/opt/local/bin:/usr/local/opt:$PATH:$HOME/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

EDITOR=vim
editor=vim

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(git Composer docker encode64 npm osx colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration

mkcd () {
  mkdir -p "$*"
  cd "$*"
}

cdl () {
  cd "$*"
  ls -la
}

alias -s html=vim
alias -s php=vim
alias -s css=vim
alias -s js=vim
alias -s py=vim
alias -s sql=vim
alias -s cpp=vim
alias -s y=vim
alias -s c=vim
alias -s h=vim
alias -s txt=vim
alias -s log=tail

setopt AUTO_PUSHD
setopt BRACE_CCL

bindkey -v
bindkey '^R' history-incremental-search-backward

export MAVEN_OPTS="-Xmx2048m -XX:MaxPermSize=512m"
export _JAVA_OPTIONS="-Xmx2g"

export PROMPT='$FG[089]%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%#%{$reset_color%} '

schedprompt() {
  emulate -L zsh
  zmodload -i zsh/sched
  integer i=${"${(@)zsh_scheduled_events#*:*:}"[(I)schedprompt]}
	(( i )) && sched -$i
  sched +1 schedprompt
}

schedprompt

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM
# rbenv setup - https://github.com/sstephenson/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# source /usr/local/bin/virtualenvwrapper_lazy.sh
export PIP_VIRTUALENV_BASE=$WORKON_HOME

nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  nvm $@
}

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$HOME/.yarn/bin:$PATH
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH

LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:"${LD_LIBRARY_PATH}"
CPATH=/usr/local/opt/openssl/include:"${CPATH}"
PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig:"${PKG_CONFIG_PATH}"
export LD_LIBRARY_PATH CPATH PKG_CONFIG_PATH

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
