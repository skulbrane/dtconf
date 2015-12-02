#echo "exec: $0/$1"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nanotech"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(gitm battery)

# User configuration

#export PATH="/usr/local/bin:/usr/bin:/bin:/opt/bin:/c/Portable/ConEmu:/c/Portable/ConEmu/ConEmu:/c/Program Files/Python 3.5:/c/Program Files/Python 3.5/Scripts:/c/Program Files/Python 3.5/Lib/site-packages:/c/Program Files/Python 3.5:/c/Program Files (x86)/Intel/iCLS Client:/c/Program Files/Intel/iCLS Client:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/Program Files/Intel/Intel(R) Management Engine Components/DAL:/c/Program Files/Intel/Intel(R) Management Engine Components/IPT:/c/Program Files (x86)/Intel/Intel(R) Management Engine Components/DAL:/c/Program Files (x86)/Intel/Intel(R) Management Engine Components/IPT:/c/Program Files/Intel/WiFi/bin:/c/Program Files/Common Files/Intel/WirelessCommon:/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/c/Program Files (x86)/GtkSharp/2.12/bin:/c/Program Files/nodejs:/c/Users/Geoffrey/.dnx/bin:/c/Program Files/Microsoft DNX/Dnvm:/c/Program Files (x86)/Windows Kits/8.1/Windows Performance Toolkit:/c/Ruby22-x64/bin:/c/Program Files (x86)/Microsoft VS Code/bin:/c/Users/Geoffrey/AppData/Roaming/npm:/c/Portable/curl:c/Portable/ConEmu:/c/Portable/npp.6.7.7:/c/Portable/PuTTYPortable:/c/Portable/Sublime Text Build 3083:/c/Portable:/c/ctags58:/c/vim72:/c/Program Files/Git/bin:/c/unxutils/bin:/c/unxutils/usr/local/wbin"
export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

if [[ -z $DTCONF ]]; then
  export DTCONF=$HOME/dtconf/
fi

# Load all custom startup scripts
# We could leverage $ZSH_CUSTOM for this, but we may want to
# decouple any oh-my-zsh deps in our zsh startup scripts...
if [[ -d $DTCONF/zshrc.d ]]; then
  for file in $DTCONF/zshrc.d/*.zsh; do
    print "sourcing file: %s" $file
    source $file
fi
