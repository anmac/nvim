local options = {
  style = "moon",
  light_style = "moon",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true, bold = true },
    functions = {},
    variables = { bold = true },
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help", "vista_kind", "terminal", "packer", "NvimTree" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
}

require("tokyonight").setup(options)
