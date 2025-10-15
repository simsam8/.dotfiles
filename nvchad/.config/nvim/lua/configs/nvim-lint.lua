local lint = require "lint"
lint.linters_by_ft = {
  python = { "ruff" },
}

local ruff = require("lint").linters.ruff
