echo ""$0" "$1""

source "$HOME/dtconf/shlib/shlenv.zsh"

if [ "$(is_linux)" -eq 0 ]; then
    # Python Config
    export PIP_REQUIRE_VIRTUALENV=true
    export VIRTUAL_ENV_DISABLE_PROMPT=1

    # 'PYDEV' is personal python projs
    export PYDEV_HOME="/root/dev/pydev"
    export PYDEV_LIBS_HOME="/root/dev/pylibs"

    # Enable ZSH colors
    autoload -U colors && colors

    pyenv_python_version() {
         result=""
         pyenv_version="$(pyenv version-name)";
         if [ -n "$pyenv_version"  ]; then
             result="$pyenv_version"
        fi
        [[ -n "$result" ]] && echo "($result) "
    }

    export PYENV_PROMPT="\$(pyenv_python_version)"
else
    # Pythonz Setup
    [[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

    # virtualenvwrapper setup
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=/c/work/src/python

    # project directory location
    # must be set and dir created before `mkproject` is used
    export PROJECT_HOME=/c/work/src/python

    # define project config filename
    export VIRTUALENVWRAPPER_PROJECT_FILENAME=.venvwrapper_proj

    # set default virtualenv args
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

    export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh

    VIRTUALENVWRAPPER_LAZY=/usr/bin/virtualenvwrapper_lazy.sh
    [[ -s $VIRTUALENVWRAPPER_LAZY ]] && source $VIRTUALENVWRAPPER_LAZY
fi
