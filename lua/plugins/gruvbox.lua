return {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    undercurl = false,
    underline = false,
    bold = true,
    -- italic = {
    --   strings = true,
    --   comments = true,
    --   operators = false,
    --   folds = true,
    -- },
    italic = true,
    strikethrough = true,
    invert_selection = true,
    invert_signs = false,
    invert_tabline = true,
    invert_intend_guides = true,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = true,
    transparent_mode = false,
  },
  config = function(_, opts)
    local colorscheme = "gruvbox"
    local status_ok, gruvbox = pcall(require, colorscheme)
    if not status_ok then
      vim.notify("Gruvbox Plugin Failed!")
      return
    else
      gruvbox.setup(opts)
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
  cond = false,
}
