# Shamless theft of this dude's stuff: https://github.com/garybernhardt/dotfiles/blob/master/.zsh/func/prompt_grb_setup

function minutes_since_last_commit {
    now=`date +%s`
    last_commit=`git log --pretty=format:'%at' -1 2>/dev/null`

    if $lastcommit ; then
        seconds_since_last_commit=$((now-last_commit))
        minutes_since_last_commit=$((seconds_since_last_commit/60))
        echo $minutes_since_last_commit
    else
        echo "-1"
    fi
}
