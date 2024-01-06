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
}
