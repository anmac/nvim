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
      invert_selection = true,
      invert_signs = false,
      invert_tabline = true,
      invert_intend_guides = true,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = { dark0_hard = "#151723" },
      overrides = {
        NonText = { fg = "#50545d" },
        LineNr = { fg = "#6d707c" },
        ["@parameter"] = { italic = true },
        ["@type.java"] = { link = "GruvboxAqua" },
        ["@variable.parameter.java"] = { italic = true },
        ["@lsp.type.modifier.java"] = { link = "GruvboxOrange" },

        Comment = { fg = "#81878f", italic = true, bold = true },
        ContextVt = { fg = "#878788" },
        Define = { link = "GruvboxPurple" },
        DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
        Macro = { link = "GruvboxPurple" },
        ["@constant.builtin"] = { link = "GruvboxPurple" },
        ["@namespace.latex"] = { link = "Include" },
        ["@namespace.rust"] = { link = "Include" },
        ["@storageclass.lifetime"] = { link = "GruvboxAqua" },
        ["@text.note"] = { link = "TODO" },

        -- fold
        FoldColumn = { fg = "#fe8019", bg = "#0E1018" },
        Folded = { fg = "#fe8019", bg = "#3c3836", italic = true },
        SignColumn = { bg = "#fe8019" },

        -- new git colors
        DiffAdd = { bold = true, reverse = false, fg = "", bg = "#2a4333" },
        DiffChange = { bold = true, reverse = false, fg = "", bg = "#333841" },
        DiffDelete = { bold = true, reverse = false, fg = "#442d30", bg = "#442d30" },
        DiffText = { bold = true, reverse = false, fg = "", bg = "#213352" },

        -- statusline
        CursorLineNr = { fg = "#5eacd3", bg = "" },
        GruvboxAquaSign = { fg = "#8EC07C", bg = "" },
        GruvboxBlueSign = { fg = "#83a598", bg = "" },
        GruvboxGreenSign = { fg = "#b8bb26", bg = "" },
        GruvboxOrangeSign = { fg = "#dfaf87", bg = "" },
        GruvboxRedSign = { fg = "#fb4934", bg = "" },
        StatusLine = { bg = "#ffffff", fg = "#0E1018" },
        StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
        WilderAccent = { fg = "#f4468f", bg = "" },
        WilderMenu = { fg = "#ebdbb2", bg = "" },

        -- neorg
        ["@neorg.markup.inline_macro"] = { link = "GruvboxGreen" },
      },
      dim_inactive = false,
      transparent_mode = false,
    },
  },
}
