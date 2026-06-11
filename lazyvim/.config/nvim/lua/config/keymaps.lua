-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", ";", ":", { noremap = true, silent = true })

local function nav(direction, vim_dir)
  return function()
    local cur = vim.fn.winnr()
    vim.cmd("wincmd " .. vim_dir)
    if cur == vim.fn.winnr() then
      vim.fn.system("tmux select-pane -" .. direction)
    end
  end
end
vim.keymap.set("n", "<C-h>", nav("L", "h"))
vim.keymap.set("n", "<C-j>", nav("D", "j"))
vim.keymap.set("n", "<C-k>", nav("U", "k"))
vim.keymap.set("n", "<C-l>", nav("L", "l")) -- note: should be '-R'
