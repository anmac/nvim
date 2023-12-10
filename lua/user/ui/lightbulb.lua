M = {
  priority = 10,
  hide_in_unfocused_buffer = true,
  link_highlights = true,
  validate_config = "auto",
  action_kinds = nil,
  -- 1. Sign column.
  sign = {
    enabled = true,
    text = "💡",
    hl = "LightBulbSign",
  },
  -- 2. Virtual text.
  virtual_text = {
    enabled = false,
    text = "💡",
    pos = "eol",
    hl = "LightBulbVirtualText",
    hl_mode = "combine",
  },
  -- 3. Floating window.
  float = {
    enabled = false,
    text = "💡",
    hl = "LightBulbFloatWin",
    win_opts = {
      focusable = false,
    },
  },
  -- 4. Status text.
  status_text = {
    enabled = false,
    text = "💡",
    text_unavailable = "",
  },
  -- 5. Number column.
  number = {
    enabled = false,
    hl = "LightBulbNumber",
  },
  -- 6. Content line.
  line = {
    enabled = false,
    hl = "LightBulbLine",
  },
  autocmd = {
    enabled = true,
    updatetime = 200,
    events = { "CursorHold", "CursorHoldI" },
    pattern = { "*" },
  },
  ignore = {
    -- LSP client names to ignore.
    -- Example: {"null-ls", "lua_ls"}
    clients = { "null-ls", "lua_ls" },
    ft = {
      "cmp_docs",
      "cmp_menu",
      "noice",
      "prompt",
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
      "netrw",
      "NvimTree",
      "packer",
      "spectre_panel",
      "startify",
      "toggleterm",
      "TelescopePrompt",
    },
    -- Ignore code actions without a `kind` like refactor.rewrite, quickfix.
    actions_without_kind = false,
  },
}

return M
