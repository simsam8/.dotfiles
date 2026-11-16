-- xledger: C# uses the repo's cs-fmt, same as its CI/pre-commit hook.
-- Only active under a .config/dotnet-tools.json; elsewhere conform falls back to LSP.
return {
  formatters = {
    cs_fmt = {
      command = "dotnet",
      -- --stdin-path must be absolute ($FILENAME is) or cs-fmt ignores .editorconfig
      args = { "tool", "run", "cs-fmt", "format", "--no-cache", "--no-msbuild-check", "--stdin-path", "$FILENAME" },
      cwd = function(_, ctx)
        return vim.fs.root(ctx.dirname, ".config/dotnet-tools.json")
      end,
      require_cwd = true,
    },
  },
  formatters_by_ft = { cs = { "cs_fmt" } },
}
