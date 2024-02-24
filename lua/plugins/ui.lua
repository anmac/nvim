local Util = require("util")

return {
  {
    "rcarriga/nvim-notify",
    -- keys = {
    --   {
    --     "<leader>un",
    --     function()
    --       require("notify").dismiss({ silent = true, pending = true })
    --     end,
    --     desc = "Dismiss all Notifications",
    --   },
    -- },
    opts = {
      timeout = 3000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    init = function()
      -- when noice is not enabled, install notify on VeryLazy
      if not Util.has("noice.nvim") then
        Util.on_very_lazy(function()
          vim.notify = require("notify")
        end)
      end
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = { enabled = true, show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "",
          "Markdown",
          "NvimTree",
          "TelescopePrompt",
          "TelescopeResult",
          "Trouble",
          "alpha",
          "checkhealth",
          "dashboard",
          "fugitive",
          "gitcommit",
          "help",
          "lazy",
          "lazyterm",
          "lspinfo",
          "man",
          "markdown",
          "mason",
          "neo-tree",
          "neogitstatus",
          "notify",
          "packer",
          "startify",
          "toggleterm",
          "trouble",
        },
        buftypes = { "terminal", "nofile", "quickfix", "prompt", "nvimtree" },
      },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "html",
        css = { names = true },
        scss = { names = true },
        "javascript",
        "typescript",
        "php",
        "lua",
        "conf",
      },
      user_default_options = {
        names = false,
        css = true,
        tailwind = true,
        sass = { enable = true },
      },
    },
    config = function(_, opts)
      require("colorizer").setup(opts)
    end,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require("lazy").load({ plugins = { "dressing.nvim" } })
        return vim.ui.input(...)
      end
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    -- enabled = false,
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        hover = {
          enabled = true,
          silent = true,
        },
        signature = {
          enabled = true,
          view = "hover",
        },
      },
      health = { checker = true },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
    },
  }
}
