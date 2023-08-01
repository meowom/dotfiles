
# Run Zellij with a specific layout
zellij_with_layout() {
    zellij --layout "$@"
}
compdef '_files -W ~/.config/zellij/layouts -/' zellij_with_layout
alias zjl='zellij_with_layout'

# Attach to an existing Zellij session
_zellij_attach() {
  local sessions
  sessions=($(zellij list-sessions | grep -oE '^\S+'))
  _describe 'values' sessions
}
compdef _zellij_attach zja
