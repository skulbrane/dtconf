# TODO: This file does not make much sense, most of this
#       config should prob live in shlenv.zsh
#
export DATE=$(date +'20%y-%m-%d')
export TRUE=1
export FALSE=0

source "$HOME/dtconf/shlib/shlenv.zsh"

if [ ! "$(is_linux)" -eq 0 ]; then
    # Required Environment Variables
    #
    # SYSTEMROOT - Windows Base Dir (usually X:\Windows)
    MSYS_ID="Msys"
    MINGW64_ID="MINGW64"

    function print_motd() {
        echo $ - "Initialized shell: "$SHELL""
        echo $(uname -a)
        echo $(uptime)
        #echo $(df -h /)
    }

    # Print error if any essential envar missing
    # TODO: Define and try some fallbacks
    #
    # ${STATE?"Need to set STATE"}
    # ${DEST:?"Need to set DEST non-empty"}
    function ensure_environment() {
        # TODO...
        echo $FALSE
    }

    function set_path() {
        os=$(uname -o)

        if [[ $os = $MSYS_ID ]]; then
            [[ ! -z $DBG ]] && echo "System: Msys"
            if [[ $MSYSTEM = $MINGW64_ID ]]; then
                [[ ! -z $DBG ]] && echo "System Type: MINGW64"
                export PATH=/e/Portable/Win/msys64/mingw64/bin:$PATH
                [[ ! -z $DBG ]] && echo "Setting PATH:"$PATH

            fi
        fi

        export PATH="$PATH:$HOME/bin/:/usr/bin:/opt/bin/:/c/Windows/System32/"
    }

    set_path
    print_motd
fi
