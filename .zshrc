thisfile=""$0"/"$1""

source "$HOME/dtconf/shlib/shlenv.zsh"

export TERM="xterm-256color"

# Used to guess vi or emacs input mode
export EDITOR="$(which vim)"

# Path to your oh-my-zsh installation.
export ZSH=/root/.oh-my-zsh

PATH_LOCAL='/root/local/bin'

if [ DT_PROMPT_STYLE = "liquid" ]; then
    [[ $- = *i*  ]] && source ~/dtconf/ext/liquidprompt/liquidprompt.plugin.zsh
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerline"

# oh-my-zsh powerline-theme config
POWERLINE_RIGHT_A="$PYENV_PROMPT"
POWERLINE_RIGHT_A_COLOR_FRONT="green"
POWERLINE_RIGHT_A_COLOR_BACK="black"
POWERLINE_SHORT_HOST_NAME="true"
POWERLINE_PATH="short"
POWERLINE_SHOW_GIT_ON_RIGHT="true"
POWERLINE_DETECT_SSH="true"
POWERLINE_DATE_FORMAT="%D{%d-%m}"

POWERLINE_HIDE_USER_NAME="false"
#POWERLINE_HIDE_HOST_NAME="false"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#"" DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras pyenv virtualenv pep8 colored-man-pages colorize bower encode64 fancy-ctrl-z gnu-utils go golang grunt heroku urltools vagrant vi-mode web-search zsh-navigation-tools)
# broken? virtualenvwrapper

# User configuration
export PATH="$PATH_LOCAL"":""/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# Github 'hub' config, $PATH must contain 'hub'
eval "$(hub alias -s)"
export GITHUB_USER='skulbrane'

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="$(which vim)"
 else
    export EDITOR="$(which vim)"
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
#export SSH_KEY_PATH="~/.ssh/dsa_id"

# TODO: Configurable intall location
if [[ -z "$DT_HOME" ]]; then
    export DTCONF="$HOME/dtconf/"
fi

# Load all custom startup scripts
# We could leverage $ZSH_CUSTOM for this, but we may want to
# decouple any oh-my-zsh deps in our zsh startup scripts...
if [[ -d $DTCONF/.zshrc.d ]]; then
    for file in $DTCONF/.zshrc.d/*.zsh; do
        print "sourcing file: %s" "$file"
        source "$file"
    done
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Powerline zsh
#function _update_ps1() {
#    export PROMPT="$(~/powerline-zsh.py $?)"
#}
#precmd() {
#    _update_ps1
#}
