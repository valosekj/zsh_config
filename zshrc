# zshrc config file for UNIX and MacOS without using oh-my-zsh, Jan Valosek

# OS specific commands are in case statement below
case `uname` in
  Darwin)
    # commands for OS X
    # Default prompt
    PS1='%F{green}%n@%m%f:%F{blue}%~$%f '
    # Alias for colorful ls output
    alias ls='CLICOLOR_FORCE=1 ls -G'
    # nano from homebrew
    alias nano='/usr/local/bin/nano'
  ;;
  Linux)
    # commands for Linux
    # Default prompt - color codes - https://jonasjacek.github.io/colors/
    PS1='%F{76}%n@%m%f:%F{74}%~$%f '
    # Alias for colorful ls output
    alias ls='ls --color=always'
    # Allow moving between words in zsh command using ctrl + left_arrow and ctrl + right_arrow
    # (on MacOS, moving can be done by option + left_arrow or right_arrow)
    bindkey -e
    bindkey '^[[1;5C' forward-word
    bindkey '^[[1;5D' backward-word
    # Permissions
    umask 0002
  ;;
esac

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# aliases for ls command
alias ll='ls -lath'
alias grep='grep --color=always'
#alias lh='ls -lath | head -10'
#alias lt='ls -lath | tail -10'
# Functions for ls in combination with head or tail commands with definable number of output lines
function lh { if [ "$#" -eq 0 ];then num=10;else num=${1};fi; ls -lath | head -${num} }
function lt { if [ "$#" -eq 0 ];then num=10;else num=${1};fi; ls -lath | tail -${num} }

# count items in directory
alias countf='ls -1 $1 | wc -l'

# alias for which command (to have same behaviour as in bash)
# https://stackoverflow.com/a/14196212/12605960
alias which='whence -p'

# aliases for venv workflow
# https://www.youtube.com/watch?v=fTs7yAIUiso
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
alias de='deactivate'

# Use modern completion system
autoload -Uz compinit
compinit

# Uncomment the following line to enable command auto-correction
setopt correct

# Auto cd
setopt autocd

# Shared history between terminals
setopt sharehistory
# History substitution (replacement of !!)
setopt HIST_VERIFY

# Case insensitive globbing
setopt NO_CASE_GLOB

# Disable globbing - https://unix.stackexchange.com/a/310553
setopt +o nomatch
