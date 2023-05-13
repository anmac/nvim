local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
  vim.notify("illuminate plugin failed!")
  return
end

illuminate.configure({
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 90,
  filetypes_denylist = {
    "alpha",
    "dapui_scopes",
    "dapui_breakpoints",
    "dapui_stacks",
    "dapui_watches",
    "dap-repl",
    "dap-terminal",
    "dapui_console",
    "dashboard",
    "dirvish",
    "DressingInput",
    "fugitive",
    "help",
    "lazy",
    "lspinfo",
    "Man",
    "man",
    "mason",
    "Markdown",
    "NvimTree",
    "packer",
    "spectre_panel",
    "startify",
    "toggleterm",
    "TelescopePrompt",
    "",
  },
  modes_denylist = { "nt", "v", "vs", "V", "Vs", "CTRL-V", "CTRL-Vs", "CTRL-S", "R", "c", "!", "t", "x" },
  under_cursor = true,
  min_count_to_highlight = 1,
})
