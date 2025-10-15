local lint = require("lint")
lint.linters_by_ft = {
  python = { "flake8" },
}

local flake8 = require("lint").linters.flake8

flake8.args = {
  '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
  '--no-show-source',
  '--stdin-display-name',
  function() return vim.api.nvim_buf_get_name(0) end,
  "--max-line-length",
  "88",
  "--extend-ignore",
  "E203",
  "-",
}
