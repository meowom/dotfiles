-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.cmd("cd ~/projects/notes")
  vim.o.guifont = "Hack Nerd Font Mono:h18" -- text below applies for VimScript
  vim.g.neovide_cursor_animation_length = 0
end
