# If you come from bash you might have to change your $PATH.
export PATH=/Users/freshgrade/.nvm/versions/node/v7.0.0/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Path to your oh-my-zsh installation.
export ZSH=/Users/steve/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HISTFILE="/Users/freshgrade/.zsh_history"
HISTSIZE="256"
SAVEHIST="1024"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

#source $ZSH/oh-my-zsh.sh

# User configuration

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export GITHUB_USERNAME="Windovvsill"
export GITHUB_TOKEN="0fc834ead1571378ac404d5e8de20dda423866de"
export GITHUB_ORGANIZATION="Freshgrade"
export FIS_ADMIN_PASSWORD="Freshgrade"
export FIS_RESTTEMPLATE_AUTHORIZATIONHEADERVALUE="Freshgrade"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gits="git status"
alias gitr="git remote -v"
alias pump="cd ~/Documents/esd/Pump-Simulation/ && gits"
alias fas="cd ~/fg/freshgrade-authentication-server/ && gits"
alias fis="cd ~/fg/freshgrade-integration-server/ && gits"
alias fresh="cd ~/fg/freshgrade/ && nvm use 4.4.7 && gits"
alias logtree="git log --graph --decorate --oneline $(git rev-list -g --all)"
alias startday="cd /Users/freshgrade/fg/autobot ; vagrant up fg-local-single ; vagrant up fg-local-proxy ; gits"
alias endday="vagrant halt fg-local-proxy ; vagrant halt fg-local-single"
alias ansible2.1="source ~/fg/autobot/ansible2.1/bin/activate"
alias ansible1.9="source ~/fg/autobot/ansible1.9/bin/activate"
# alias "git recent"="git for-each-ref --count=20 --sort=-committerdate refs/heads/ --format="%(refname:short)"
alias hot_reload="ansible-playbook -i inventory/local-single --vault-password-file=~/fg/vaultpass fg-env.yml --tags hot_reload -l fg-local-single -v"
alias oauth2_proxy_reload="ansible-playbook -i inventory/local-single --vault-password-file=~/fg/vaultpass fg-env.yml --tags oauth2_proxy -l fg-local-single -v"
alias fgls="ssh fg-local-single"
alias copyLastCmd='fc -ln -1 | sed "1s/^[[:space:]]*//" | awk 1 ORS="" | pbcopy '

#Arhcey
archey

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export NVM_DIR="/Users/freshgrade/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

autoload -Uz promptinit
promptinit
prompt adam2

