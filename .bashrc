#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

pfetch

alias home='cd ~'
alias back='cd ..'
alias dls='cd ~/Downloads'
alias docs='cd ~/Documents'
alias pics='cd ~/Pictures'
alias lab='cd ~/Lab'
alias vms='cd ~/Lab/VMs'
alias ll='ls -l'
alias lsa='ls -a'
alias lss='ls -s'
alias list='ls -alsh'
alias sd='shutdown -h now'
alias rb='reboot'
alias v='nvim'
alias n='nano'

# Applications Added to Path.

export PATH="$PATH:$HOME/.config/emacs/bin"

# Call for starship

eval "$(starship init bash)"

# start ssh - agent
env=~/.ssh/agent.env

agent_load_env() { test -f "$env" && . "$env" >|/dev/null; }
agent_start() {
  (
    umask 077
    ssh-agent >|"$env"
  )
  . "$env" >|/dev/null
}

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(
  ssh-add -l >|/dev/null 2>&1
  echo $?
)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
  agent_start
  ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
  ssh-add
fi

unset env

# source plugins.

# Bash-Completeion Plugin.
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Bash-Syntax-High-Lighting Plugin
source ~/.local/share/blesh/ble.sh

# source Bash-PreExec (Must be LAST in BASHRC. Period.)
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
