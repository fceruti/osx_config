# homebrew
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}

# virtualenv wrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# history
export HISTSIZE=10000
export HISTFILESIZE=10000


GREEN="[32;40m"
YELLOW="[33;40m"
WHITE="[0m"
RED="[0;31m"
#funcionts
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function git_text () {
  if [ -n "$(parse_git_branch)" ]
  then
    echo " branch:$(parse_git_branch)"
  else
    echo ""
  fi
}


PS1='\e${GREEN}\u\]\e[0m@\e${YELLOW}\h\e${WHITE}:$PWD$\e${RED}$(git_text)\e${WHITE}
=> '

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
