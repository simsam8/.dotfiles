require("nvchad.configs.lspconfig").defaults()

-- vim.lsp.config("*", {
--   root_markers = { ".git" },
-- })

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "basic",
      },
    },
  },
})

-- Must enable servers after setting up the configs.
-- Otherwise the default config is used.
local servers = { "html", "cssls", "basedpyright", "bashls", "omnisharp", }
vim.lsp.enable(servers)
