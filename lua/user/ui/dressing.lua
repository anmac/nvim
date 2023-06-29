M = {
  input = {
    enabled = true,
    default_prompt = "Input:",
    title_pos = "center",
    insert_only = false,
    start_in_insert = true,
    anchor = "SW",
    border = "rounded",
    relative = "editor",
    prefer_width = 0.6,
    width = nil,
    max_width = { 0.3 },
    min_width = { 15, 0.25 },
    buf_options = {},
    win_options = {
      winblend = 0,
      wrap = false,
      list = true,
      listchars = "precedes:…,extends:…",
      sidescrolloff = 5,
    },
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },
  },
  select = {
    enabled = true,
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
    trim_prompt = true,
    telescope = nil,
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      buf_options = {
        swapfile = false,
        filetype = "DressingSelect",
      },
      win_options = {
        winblend = 10,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },
    builtin = {
      anchor = "NW",
      border = "rounded",
      relative = "editor",

      buf_options = {},
      win_options = {
        winblend = 0,
      },
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },
      mappings = {
        ["<Esc>"] = "Close",
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
      },
    },
  },
}

return M
