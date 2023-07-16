local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  vim.notify("Null-ls Plugin Failed!")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

M = {
  border = "rounded",
  cmd = { "nvim" },
  debounce = 250,
  debug = false,
  default_timeout = 5000,
  diagnostic_config = {},
  diagnostics_format = "#{m}",
  fallback_severity = vim.diagnostic.severity.ERROR,
  log_level = "warn",
  notify_format = "[null-ls] %s",
  on_attach = nil,
  on_init = nil,
  on_exit = nil,
  root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git", ".idea", ".vscode"),
  sources = {
    -- Prettier -> html,css,js,ts,json,yaml,markdown...
    formatting.prettierd,
    -- Lua Formatting
    formatting.stylua.with({
      extra_args = { "--indent-type", "Spaces", "--quote-style", "ForceDouble", "--indent-width", "2" }
    }),
  },
}

return M
