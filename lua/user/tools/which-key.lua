local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("Which-Key Plugin Failed!")
  return
end

M = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  key_labels = {},
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<C-d>",
    scroll_up = "<C-u>",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local mappings = {
  ["/"] = { "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", "Toggle current line (linewise)" },

  b = {
    name = "Buffer",
    d = { "<cmd>lua require('mini.bufremove').delete(0, false)<CR>", "Delete buffer" },
    D = { "<cmd>lua require('mini.bufremove').delete(0, true)<CR>", "Force delete" },
  },

  c = { name = "Code" },

  f = {
    name = "Find",
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
    f = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
      "Find Files",
    },
    F = { "<cmd>Telescope find_files<CR>", "Find Files with Preview" },
    g = { "<cmd>Telescope live_grep<CR>", "Find Text" },
    G = { "<cmd>Telescope grep_string<CR>", "Find in current File" },
    h = { "<cmd>Telescope help_tags<CR>", "Help" },
    i = { "<cmd>Telescope media_files<CR>", "Media" },
    k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    l = { "<cmd>Telescope resume<CR>", "Last Search" },
    M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
    n = { "<cmd>Telescope notify<CR>", "Notifications" },
    r = { "<cmd>Telescope oldfiles<CR>", "Recent Files" },
    R = { "<cmd>Telescope registers<CR>", "Registers" },
    t = { "<cmd>TodoTelescope<CR>", "Todos" },
    x = { "<cmd>Telescope commands<CR>", "Commands" },
    z = { "<cmd>Telescope command_history<CR>", "Command History" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<CR>", "View Git Branches" },
    c = { "<cmd>Telescope git_commits<CR>", "View Git Commits" },
    d = { "<cmd>Gitsigns diffthis HEAD<CR>", "Diff" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>Gitsigns next_hunk<CR>", "Next Hunk" },
    k = { "<cmd>Gitsigns prev_hunk<CR>", "Prev Hunk" },
    l = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Line Blame" },
    L = { "<cmd>Gitsigns blame_line<CR>", "Popup Blame" },
    o = { "<cmd>Telescope git_status<CR>", "View Git Status" },
    p = { "<cmd>Gitsigns preview_hunk_inline<CR>", "Preview Hunk Inline" },
    P = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk Popup" },
    r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
    R = { "<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
    s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
    u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
  },

  L = {
    name = "Lazy",
    b = { "<cmd>Lazy build<CR>", "Build"},
    c = { "<cmd>Lazy check<CR>", "Check"},
    C = { "<cmd>Lazy clean<CR>", "Clean"},
    d = { "<cmd>Lazy debug<CR>", "Debug"},
    h = { "<cmd>Lazy home<CR>", "Home"},
    H = { "<cmd>Lazy help<CR>", "Help"},
    i = { "<cmd>Lazy install<CR>", "Install"},
    l = { "<cmd>Lazy load<CR>", "Load"},
    L = { "<cmd>Lazy log<CR>", "Log"},
    p = { "<cmd>Lazy profile<CR>", "Profile"},
    r = { "<cmd>Lazy restore<CR>", "Restore"},
    s = { "<cmd>Lazy sync<CR>", "Sync"},
    u = { "<cmd>Lazy update<CR>", "Update"},
  },

  n = {
    name = "Split",
    s = { "<cmd>split<CR>", "HSplit" },
    v = { "<cmd>vsplit<CR>", "VSplit" },
  },

  s = {
    name = "Search",
    r = { "<cmd>lua require('spectre').open()<CR>", "Replace in files (Spectre)" },
    c = { "<cmd>lua require('spectre').open_file_search()<CR>", "Search on current file" },
    d = { "<cmd>Trouble<CR>", "Trouble Diagnostics" },
  },

  t = {
    name = "Todo",
    t = { "<cmd>TodoTelescope<CR>", "Search through all project todos with Telescope" },
    T = { "<cmd>TodoTrouble<CR>", "List all project todos in trouble" },
    q = { "<cmd>TodoQuickFix<CR>", "Uses quickfix list to show all todos" },
    l = { "<cmd>TodoLocList<CR>", "Uses location list to show all todos" },
  },

  T = {
    name = "Treesitter",
    h = { "<cmd>TSHighlightCapturesUnderCursor<CR>", "Highlight" },
    p = { "<cmd>TSPlaygroundToggle<CR>", "Playground" },
  },
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

which_key.register(mappings, opts)

return M
