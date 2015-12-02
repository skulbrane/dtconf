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
