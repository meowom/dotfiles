# Attach to an existing Zellij session
_zellij_attach() {
  local sessions
  sessions=($(zellij list-sessions | grep -oE '^\S+'))
  _describe 'values' sessions
}
zellij_with_attach() {
  zellij attach $1
}
compdef _zellij_attach zellij_with_attach
alias zja='zellij_with_attach'

# Run Zellij with a specific layout
zellij_with_layout() {
    zellij --layout "$HOME/.config/zellij/layouts/$1"
}
compdef '_files -W ~/.config/zellij/layouts -/' zellij_with_layout
alias zjl='zellij_with_layout'

