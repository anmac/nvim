return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      aerial = true,
      harpoon = true,
      headlines = true,
      leap = true,
      lsp_trouble = true,
      mason = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      nvimtree = true,
      symbols_outline = true,
      treesitter = true,
      treesitter_context = true,
      ts_rainbow = true,
      ts_rainbow2 = true,
      which_key = true,
    },
  },
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end
}
