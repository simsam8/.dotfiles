require "nvchad.autocmds"

-- -- Custom autocommands
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave", "BufWritePost" }, {
  callback = function()
    local lint_status, lint = pcall(require, "lint")
    if lint_status then
      lint.try_lint()
    end
  end,
})
