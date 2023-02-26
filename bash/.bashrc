# history
HISTCONTROL=ignoreboth:erasedups

# prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1] /'
}
PS1='\[\e[0;1m\]$(parse_git_branch)\[\e[0;1m\]\w\n\[\033[0m\]\$ '

# ls alias width
alias ls='ls -p --width=80 --color=auto'
