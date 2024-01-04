# terminal theme
ZSH_THEME="macovsky"

# plugins
plugins=(git docker)

# user configuration
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

# language envrionment
export LANG=en_US.UTF-8

# preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# aliases
alias ls="ls -lhpG"
alias v="nvim"

# git aliases
local GIT_LOG_FORMAT="--pretty=format:\"* <%C(yellow)%h%Creset> [%as] %C(bold green)(%ar)%Creset ~ %C(bold blue)%an%Creset: %s %C(auto)%d%Creset\""
alias gsh="g show --pretty=format:\"%Cred%h%Creset %C(yellow)%d%Creset - %s [%Cblue%an%Creset]\""
alias glo="git log ${GIT_LOG_FORMAT}"
alias gloo="git --no-pager log ${GIT_LOG_FORMAT} -n1"
alias gstum="git stash --include-untracked -m"

alias curltime="curl -w \"@$HOME/workspace/dotfiles/configs/curl-format.txt\" -o /dev/null -s "
