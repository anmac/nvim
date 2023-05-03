local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  vim.notify("lualine failed!")
  return
end

local status_theme_ok, theme = pcall(require, "lualine.themes.auto")
if not status_theme_ok then
  vim.notify("lualine theme auto failed!")
  return
end

local hide_component_in_width = function()
  return vim.fn.winwidth(0) > 50
end

local hide_location_in_width = function()
  return vim.fn.winwidth(0) > 100
end

local branch = {
  "branch",
  icon = { "", color = { fg = "#d16969", bg = "" } },
  color = { fg = "#dfafdf", bg = "" },
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_lsp" },
  sections = { "error", "warn", "hint" },
  symbols = { error = " ", warn = " ", hint = " " },
  update_in_insert = true,
  always_visible = true,
}

local diff = {
  "diff",
  diff_color = {
    added = "DiagnosticInfo",
    modified = "DiagnosticWarn",
    removed = "DiagnosticError",
  },
  symbols = { added = " ", modified = " ", removed = " " },
  cond = hide_component_in_width,
}

local location = {
  "location",
  fmt = function(str)
    local line, col = string.match(str, "(%d+):(%d+)")
    return string.format("Ln %s,Col %s", line, col)
  end,
  color = { fg = "#fff" },
  cond = hide_location_in_width,
}

local spaces = {
  function()
    return "Spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  end,
  color = { fg = "#fff" },
  cond = hide_component_in_width,
}

local eof = {
  function()
    local format = vim.bo.fileformat
    if format == "unix" then
      return "LF"
    elseif format == "dos" then
      return "CRLF"
    else
      return "Unknown"
    end
  end,
  color = { fg = "#fff" },
  cond = hide_component_in_width,
}

local encoding = {
  "encoding",
  fmt = string.upper,
  color = { fg = "#fff" },
  cond = hide_component_in_width,
}

local filetype = {
  "filetype",
  fmt = function(str)
    if vim.fn.expand("%:t") == "NvimTree_1" then
      return "🌳" .. str
    end
    return str
  end,
  color = { fg = "#fff" },
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "alpha", "dashboard" },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = false,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch },
    lualine_c = { diagnostics, diff },
    lualine_x = { location, spaces, eof, encoding, filetype },
    lualine_y = {},
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "fugitive", "fzf", "lazy", "man", "nvim-dap-ui", "toggleterm" },
})
