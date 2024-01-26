return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    term_colors = true,
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      functions = { "bold" },
      -- types = { "italic" },
    },
    custom_highlights = function()
      return {
        NonText = { fg = "#50545d" },
        LineNr = { fg = "#6d707c" },
        CursorLineNr = { fg = "#5eacd3" },
      }
    end,
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dap = true,
      dap_ui = true,
      dashboard = true,
      flash = true,
      gitsigns = true,
      harpoon = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true, colored_indent_levels = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
        inlay_hints = {
          background = true,
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neogit = true,
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      nvimtree = true,
      rainbow_delimiters = true,
      semantic_tokens = true,
      symbols_outline = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      ts_rainbow = true,
      ts_rainbow2 = true,
      ufo = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end
}
