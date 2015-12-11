# net.zsh
#
# General networking helpers

function ifc_get() {
    #eval 'ifconfig | sed -n '/^"$1"/,/^$/p'' # Dumb way, parse entire ifconfig output
    $(which ifconfig) "$1"
}

function iface_inf() {
    local count=1

    while [ -n "$1" ]
    do
        #echo "Param count #$count = $1"
        ifc_get "$1"
        count=$[ $count + 1 ]
        shift
    done
}



