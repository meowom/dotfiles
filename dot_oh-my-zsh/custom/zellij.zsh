zellij_with_layout() {
    zellij --layout "$@"
}
compdef '_files -W ~/.config/zellij/layouts -/' zellij_with_layout
alias zjl='zellij_with_layout'


_zellij_sessions_completion() {
  local sessions
  sessions=$(zellij list-sessions | awk '{print $1}')
  COMPREPLY=($(compgen -W "$sessions" -- "${COMP_WORDS[COMP_CWORD]}"))
}
alias zja='zellij attach'
complete -F _zellij_sessions_completion zja
