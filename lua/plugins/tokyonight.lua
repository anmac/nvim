return {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    style = "moon",
    light_style = "moon",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = false, bold = false },
      functions = { bold = true },
      variables = { italic = true, bold = true },
      sidebars = "dark",
      floats = "dark",
    },
    sidebars = { "qf", "help", "vista_kind", "terminal", "packer", "NvimTree" },
    day_brightness = 0.3,
    hide_inactive_statusline = false,
    dim_inactive = false,
    lualine_bold = false,
  },
  config = function(_, opts)
    local colorscheme = "tokyonight"
    local status_ok, tokyonight = pcall(require, colorscheme)
    if not status_ok then
      vim.notify("Tokyonight Plugin Failed!")
      return
    else
      tokyonight.setup(opts)
    end

    local setting_colorscheme_status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
    if not setting_colorscheme_status_ok then
      vim.notify(colorscheme .. " colorscheme not found!")
      vim.cmd.colorscheme("habamax")
      vim.notify("Loading Default Colorscheme...")
    else
      -- vim.cmd([[highlight Comment guifg=#6d707c]])
      vim.cmd([[highlight NonText guifg=#50545d]])
      vim.cmd([[highlight LineNr guifg=#6d707c]])
      vim.cmd([[highlight CursorLineNr guifg=#5eacd3]])
    end
  end,
}
