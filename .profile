# no need in windows with `chcp 65001`
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"
export DOTNET_TELEMETRY="1"
export NODE_OPTIONS="--max-old-space-size=256 --max-semi-space-size=1"
export MARKDOWN_PREVIEW_NO_OPENER=true
export MARKDOWN_PREVIEW_PORT=34567

# path
export PATH=~/.local/src/node-v18.14.0-linux-arm64/bin:$PATH


# enable bash-completion
# source $TERMUX__PREFIX/share/bash-completion/bash_completion

eval "$(zoxide init bash)"
eval "$(fzf --bash)"

# fzf
# NOTE: `fd` not work in windows
export FZF_DEFAULT_COMMAND='rg --files --no-ignore -L -. -g "!.git/*" --color=never'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND \$dir"
export FZF_ALT_C_COMMAND="fd -td -H -L -E .git --color=never"
export FZF_DEFAULT_OPTS="
--scheme=path --layout=reverse --height=30%
--color=hl:214,hl+:214,bg+:235,fg+:-1
--color=spinner:-1,info:-1,gutter:-1,header:-1,separator:-1,prompt:-1,border:-1
--no-bold --no-ansi --no-mouse --no-scrollbar --scroll-off=8 --cycle
--bind=change:top
--bind=F4:toggle-preview
--preview="bat -n --color=always {}"
--preview-window=hidden:down:50%
--preview-border=top
--tiebreak=pathname,end
"
