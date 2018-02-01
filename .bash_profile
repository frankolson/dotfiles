# Better ls
alias ls="ls -Ga"
alias ll="ls -la"

# Tab complete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Brew stuff
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

# Terminal Colors
export PS1='\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\n\[\033[32m\]$(__git_ps1) \[\033[m\]\$ '
export GIT_PS1_SHOWDIRTYSTATE=true
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# rbenv stuff
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# Rails stuff
alias kill_rails='kill -9 $(lsof -i tcp:3000 -t)'
alias be="bundle exec"
