
export NVM_DIR="/Users/freshgrade/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias ll='ls -l'
alias la='ls -a'
alias gits='git status'
test -f ~/.git-completion.bash && . $_
alias gita='git add .'
ulimit -n 1024
HISTSIZE=12000

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Docker bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
archey
source /usr/local/etc/bash_completion
source <(kubectl completion bash)
export PATH="/usr/local/opt/mongodb@3.2/bin:$PATH"
