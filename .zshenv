# $HOME/.zshenv
#   * commands to set global command search path
#   * systemwide envars
#   * should **NOT** contain comannds that produce output or assume shell is attached 
#     to a tty

echo "[*] exec: $0/$1"

[[ -a "$HOME"/.zlogin ]] && source "$HOME"/.zlogin
