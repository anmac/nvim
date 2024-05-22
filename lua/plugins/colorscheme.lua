return {

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        functions = { "bold" },
      },
      custom_highlights = function()
        return {
          NonText = { fg = "#50545d" },
          LineNr = { fg = "#6d707c" },
          CursorLineNr = { fg = "#5eacd3" },
          ["@parameter"] = { style = { "italic" } },
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
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = false },
        functions = { bold = true },
        variables = { italic = true, bold = true },
      },
      sidebars = { "qf", "help", "vista_kind", "terminal", "packer", "NvimTree" },
      on_highlights = function(hl, _)
        hl.NonText = { fg = "#50545d" }
        hl.LineNr = { fg = "#6d707c" }
        hl.CursorLineNr = { fg = "#5eacd3" }
        hl.GitSignsAdd = { fg = "#4fd6be" }
        hl.GitSignsChange = { fg = "#467bf4" }
        hl.GitSignsDelete = { fg = "#ea2e4e" }
      end,
    },
  },

  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      undercurl = false,
      underline = false,
      invert_selection = true,
      invert_signs = false,
      invert_tabline = true,
      invert_intend_guides = true,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      overrides = {
        NonText = { fg = "#50545d" },
        LineNr = { fg = "#6d707c" },
        CursorLineNr = { fg = "#5eacd3" },
        ["@parameter"] = { italic = true },
      },
      dim_inactive = false,
      transparent_mode = false,
    },
  },
}
