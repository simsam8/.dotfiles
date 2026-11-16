vim.env.PATH = vim.env.PATH .. ":/opt/mssql-tools18/bin"

return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dotenv" },
    -- Setting up db connection with connection strings via environment variables:
    -- DB_UI_<DB_NAME>=sqlserver://...
  },
}
