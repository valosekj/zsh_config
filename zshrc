# zshrc config file for UNIX and MacOS with using oh-my-zsh, Jan Valosek
# many another useful aliases can be found here - https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

# OS specific commands are in case statement below
case `uname` in
  Darwin)
    # Default prompt
    PS1='%F{green}%n@%m%f:%F{cyan}%~$%f '

    # Alias for colorful ls output
    alias ls='CLICOLOR_FORCE=1 ls -G'
    # Path to nano installed from brew
    alias nano='${HOMEBREW_CELLAR}/nano/7.1/bin/nano'

    # copy the output of pwd to the clipboard (on MacOS)
    function pwdc() {
      printf "%s" "$PWD" | pbcopy
      echo "✅ PWD copied to the clipboard"
    }

    export PATH=$PATH:$HOME/code
    export ZSH="$HOME/.oh-my-zsh"
    export PATH=$PATH:$HOME/code/bin
    
    # oh-my-zsh plugins
    # Standard plugins can be found in $ZSH/plugins/
    # Custom plugins may be added to $ZSH_CUSTOM/plugins/
    plugins=(
      git
      git-prompt
      percol
      timer
      web-search    # https://github.com/heytulsiprasad/ohmyzsh/blob/master/plugins/web-search/README.md
      )
    
    # Load autosuggestions zsh plugin installed by brew
    source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # Load syntax-highlighting zsh plugin installed by brew
    source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    HYPHEN_INSENSITIVE="true"

    source $ZSH/oh-my-zsh.sh

  ;;
  Linux)
    # Default prompt - color codes - https://jonasjacek.github.io/colors/
    PS1='%F{76}%n@%m%f:%F{74}%~$%f '
    # Alias for colorful ls output
    alias ls='ls --color=always'
    # alias for venv creation
    alias ce='virtualenv -p /usr/bin/python3 venv; echo "venv was created successfully"'
   
    # Allow moving between words in zsh command using ctrl + left_arrow and ctrl + right_arrow
    # (on MacOS, moving can be done by option + left_arrow or right_arrow)
    bindkey -e
    bindkey '^[[1;5C' forward-word
    bindkey '^[[1;5D' backward-word
    # Permissions
    umask 0002
   
    # Path to oh-my-zsh installation
    export ZSH="$HOME/.oh-my-zsh"

    # oh-my-zsh plugins
    # Standard plugins can be found in $ZSH/plugins/
    # Custom plugins may be added to $ZSH_CUSTOM/plugins/
    plugins=(
        git-prompt
        percol
        timer
        zsh-autosuggestions
        zsh-syntax-highlighting
        )    
  ;;
esac

HYPHEN_INSENSITIVE="true"
source $ZSH/oh-my-zsh.sh

# Speed up pasting into zsh terminal
# https://github.com/zsh-users/zsh-autosuggestions/issues/238#issuecomment-389324292
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# Oh-my-zsh logo
typeset -a RAINBOW
RAINBOW=(
        "$(printf '\033[38;5;196m')"
        "$(printf '\033[38;5;202m')"
        "$(printf '\033[38;5;226m')"
        "$(printf '\033[38;5;082m')"
        "$(printf '\033[38;5;021m')"
        "$(printf '\033[38;5;093m')"
        "$(printf '\033[38;5;163m')"
        )
RESET=$(printf '\033[0m')

printf '%s         %s__      %s           %s        %s       %s     %s__   %s\n'      $RAINBOW $RESET
printf '%s  ____  %s/ /_    %s ____ ___  %s__  __  %s ____  %s_____%s/ /_  %s\n'      $RAINBOW $RESET
printf '%s / __ \\%s/ __ \\  %s / __ `__ \\%s/ / / / %s /_  / %s/ ___/%s __ \\ %s\n'  $RAINBOW $RESET
printf '%s/ /_/ /%s / / / %s / / / / / /%s /_/ / %s   / /_%s(__  )%s / / / %s\n'      $RAINBOW $RESET
printf '%s\\____/%s_/ /_/ %s /_/ /_/ /_/%s\\__, / %s   /___/%s____/%s_/ /_/  %s\n'    $RAINBOW $RESET
printf '%s    %s        %s           %s /____/ %s       %s     %s          %s\n'      $RAINBOW $RESET
printf '\n'

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Aliases
alias nn='nano'
alias fin='fslinfo'
alias gag='git annex get'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'

alias l='ls -lath'
alias ll='ls -lath'
alias grep='grep --color=auto'

# typos
alias cd..='cd ..'
alias mdkir='mkdir'
alias dc='cd'
alias sl='ls'

# Count files
alias countf='ls -1 ${1:-.} 2>/dev/null | wc -l'

# Functions for ls in combination with head or tail commands with definable number of output lines
function lh { if [ "$#" -eq 0 ];then num=10;else num=${1};fi; ls -lath | head -${num} }
function lt { if [ "$#" -eq 0 ];then num=10;else num=${1};fi; ls -lath | tail -${num} }
function column_tsv { column -t -s $'\t' ${1} }
function column_csv { column -t -s $';' ${1} }

# Functions for fetching useful nifti image header info using SCT
function header { sct_image -i ${1} -header }
function orientation { sct_image -i ${1} -header | grep -E qform_[xyz] | awk '{printf "%s", substr($2, 1, 1)}' }
function dim { sct_image -i ${1} -header | grep dim | head -n 1}
function pixdim { sct_image -i ${1} -header | grep pixdim }

function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Source: https://codeberg.org/EvanHahn/dotfiles/src/branch/main/home/zsh/.config/zsh/aliases.zsh#L43
function tempe () {
  cd "$(mktemp -d)"
  chmod -R 0700 .
  if [[ $# -eq 1 ]]; then
    \mkdir -p "$1"
    cd "$1"
    chmod -R 0700 .
  fi
}

# Count columns in CSV or TSV files
count_cols() {
  if [[ ! -f "$1" ]]; then
    echo "Usage: count_cols <file.csv|file.tsv> [delimiter]"
    return 1
  fi

  local file="$1"
  local delim="$2"

  # Auto-detect delimiter if not provided
  if [[ -z "$delim" ]]; then
    case "$file" in
      *.tsv) delim=$'\t' ;;
      *.csv) delim=',' ;;
      *)
        echo "Unknown file extension. Please provide a delimiter as second argument."
        return 1
        ;;
    esac
  fi

  head -n 1 "$file" | tr "$delim" '\n' | wc -l
}

# Alias for which command (to have same behaviour as in bash)
# https://stackoverflow.com/a/14196212/12605960
alias which='whence -p'

# Preserve user enviroment and config (i.e., zsh shell) also for root user
# https://github.com/ohmyzsh/ohmyzsh/issues/5311#issuecomment-240106715
alias suroot='sudo -E -s'

# aliases for venv workflow
# https://www.youtube.com/watch?v=fTs7yAIUiso
# activate venv
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
# deactivate venv
alias de='deactivate'
# create venv (and install requirements if requirements.txt file exists)
function ce { python3 -m venv venv; echo "venv was created successfully"; if [ -f requirements.txt ]; then echo "requirements.txt file found, installing dependencies..."; source ./venv/bin/activate; pip install -r requirements.txt;fi } 


# Fix folder permission issue cause by zsh plugin zsh-autosuggestions
# https://github.com/ohmyzsh/ohmyzsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX=true
# Use modern completion system using shell function compinit
# http://zsh.sourceforge.net/Doc/Release/Completion-System.html#Initialization
autoload -Uz compinit
# Silently ignore all insecure files and directories use the option
compinit -i

# Uncomment the following line to enable command auto-correction
setopt correct

# Auto cd
setopt autocd

# Auto cat on textfiles
command_not_found_handler() {
    # Overrides the default Zsh behavior when a command isn't found.
    # If the 'command' ends in .txt or .log and exists as a file, cat its contents.
    # Otherwise, display the usual "command not found" message.
    local cmd="$1"
    shift
    if [[ "$cmd" == *.log || "$cmd" == *.txt ]] && [ -f "$cmd" ]; then
        cat "$cmd"
    else
        echo "zsh: command not found: $cmd"
    fi
}

# Shared history between terminals
setopt sharehistory
# History substitution (replacement of !!)
setopt HIST_VERIFY

# Case insensitive globbing
setopt NO_CASE_GLOB

# Disable globbing - https://unix.stackexchange.com/a/310553
setopt +o nomatch

# Prevent perl language warning (https://gist.github.com/madeagency/79dc86e8aa09aa512af5)
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# SCT
export PATH="/usr/local/sct/bin:$PATH"
export SCT_DIR=/usr/local/sct
export MPLBACKEND=Agg

# FSL
export PATH=$PATH:/usr/local/fsl/bin
export FSLDIR=/usr/local/fsl
. ${FSLDIR}/etc/fslconf/fsl.sh

# ITKsnap
export PATH=/Applications/ITK-SNAP.app/Contents/bin:$PATH

alias fsleyes='$HOME/miniconda3/envs/fsleyes/bin/fsleyes'
alias ff='$HOME/code/fsleyes_preset/fsleyes_preset.sh'

alias python='python3'
alias pip='pip3'

echo "FSLDIR            $FSLDIR"
# Print SCT version into CLI
echo "SCT_DIR           $SCT_DIR"
# Print currently used python version into CLI
echo "python3           $(python3 -V)"
echo "python            $(python -V)"

alias 'ca'='conda activate'

# Use GitHub Copilot to get shell commands from natural language descriptions.
copilot_what-the-shell () {
    TMPFILE=$(mktemp);
    trap 'rm -f $TMPFILE' EXIT;
    if /opt/homebrew/bin/github-copilot-cli what-the-shell "$@" --shellout $TMPFILE; then
      if [ -e "$TMPFILE" ]; then
        FIXED_CMD=$(cat $TMPFILE);
        print -s "$FIXED_CMD";
        eval "$FIXED_CMD"
      else
        echo "Apologies! Extracting command failed"
      fi
    else
      return 1
    fi
};
alias '??'='copilot_what-the-shell';

# Translate a natural language description of a git command to an actual git command.
copilot_git-assist () {
    TMPFILE=$(mktemp);
    trap 'rm -f $TMPFILE' EXIT;
    if /opt/homebrew/bin/github-copilot-cli git-assist "$@" --shellout $TMPFILE; then
      if [ -e "$TMPFILE" ]; then
        FIXED_CMD=$(cat $TMPFILE);
        print -s "$FIXED_CMD";
        eval "$FIXED_CMD"
      else
        echo "Apologies! Extracting command failed"
      fi
    else
      return 1
    fi
};
alias 'git?'='copilot_git-assist';

# Convert plain english to GitHub CLI commands.
copilot_gh-assist () {
    TMPFILE=$(mktemp);
    trap 'rm -f $TMPFILE' EXIT;
    if /opt/homebrew/bin/github-copilot-cli gh-assist "$@" --shellout $TMPFILE; then
      if [ -e "$TMPFILE" ]; then
        FIXED_CMD=$(cat $TMPFILE);
        print -s "$FIXED_CMD";
        eval "$FIXED_CMD"
      else
        echo "Apologies! Extracting command failed"
      fi
    else
      return 1
    fi
};
alias 'gh?'='copilot_gh-assist';
