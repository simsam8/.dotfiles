-- Formatting profiles live in lua/formatting/<name>.lua and return conform opts.
-- Select them with vim.g.formatting_profiles in lua/config/options.lua.
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    for _, name in ipairs(vim.g.formatting_profiles or {}) do
      opts = vim.tbl_deep_extend("force", opts, require("formatting." .. name))
    end
    return opts
  end,
}
