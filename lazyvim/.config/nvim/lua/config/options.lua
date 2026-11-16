-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.g.lazyvim_python_lsp = "basedpyright"

-- Formatting profiles from lua/formatting/<name>.lua ({} = LazyVim defaults only)
vim.g.formatting_profiles = { "xledger" }
