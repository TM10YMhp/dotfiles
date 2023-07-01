# history
HISTCONTROL=ignoreboth:erasedups

# prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}
PS1='[\D{%y.%m%d.%H%M|%S}] $(parse_git_branch)\w\n\[\033[0m\]\$ '

# aliases
alias ls='ls -p --width=80 --color=auto'
