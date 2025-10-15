require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- DAP
local dap = require "dap"
vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { desc = "toggle breakpoint" })
vim.keymap.set("n", "<space>dg", dap.run_to_cursor, { desc = "run to cursor" })

vim.keymap.set("n", "<space>?", function()
  require("dapui").eval(nil, { enter = true })
end, { desc = "dap inspect value" })

vim.keymap.set("n", "<F1>", dap.continue, { desc = "dap continue" })
vim.keymap.set("n", "<F2>", dap.step_into, { desc = "dap step into" })
vim.keymap.set("n", "<F3>", dap.step_over, { desc = "dap step over" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "dap step out" })
vim.keymap.set("n", "<F5>", dap.step_back, { desc = "dap step back" })
vim.keymap.set("n", "<F8>", dap.restart, { desc = "dap restart" })

-- gen.nvim
vim.keymap.set({ "n", "v", "x" }, "<leader>]", ":Gen<CR>")
