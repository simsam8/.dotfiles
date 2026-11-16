-- xledger: format like the repo's CI/pre-commit hook (.github/workflows/format.yml):
--   *.cs -> cs-fmt format, other "clean" filetypes -> cs-fmt clean.
-- Only active under a .config/dotnet-tools.json; elsewhere the usual formatters/LSP apply.
local function root(_, ctx)
  return vim.fs.root(ctx.dirname, ".config/dotnet-tools.json")
end

-- --stdin-path must be absolute ($FILENAME is) or cs-fmt ignores .editorconfig
local function cs_fmt(...)
  return {
    command = "dotnet",
    args = vim.list_extend({ "tool", "run", "cs-fmt", ... }, { "--stdin-path", "$FILENAME" }),
    cwd = root,
    require_cwd = true,
  }
end

local by_ft = { cs = { "cs_fmt" } }
for _, ft in ipairs({ "toml", "json", "jsonc", "yaml", "sql", "markdown", "fsharp", "ps1" }) do
  by_ft[ft] = { "cs_fmt_clean" }
end

return {
  formatters = {
    cs_fmt = cs_fmt("format", "--no-cache", "--no-msbuild-check"),
    cs_fmt_clean = cs_fmt("clean"),
  },
  formatters_by_ft = by_ft,
}
