# Run Zellij with a specific layout
zellij_with_layout() {
    zellij --layout "$HOME/.config/zellij/layouts/$1"
}
compdef '_files -W ~/.config/zellij/layouts -/' zellij_with_layout
alias zjl='zellij_with_layout'

alias zja='zellij ls | fzf -0 -1 | xargs -to zellij a'
