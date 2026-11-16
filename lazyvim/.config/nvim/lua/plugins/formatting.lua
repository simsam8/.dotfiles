-- Formatting profiles live in lua/formatting/<name>.lua and return conform opts.
-- Select them with vim.g.formatting_profiles in lua/config/options.lua.
-- A profile's per-filetype list replaces the default list for that filetype.
return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    for _, name in ipairs(vim.g.formatting_profiles or {}) do
      local profile = require("formatting." .. name)
      opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, profile.formatters or {})
      opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft or {}, profile.formatters_by_ft or {})
    end
  end,
}
