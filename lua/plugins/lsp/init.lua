return {

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[9] = { "<c-K>", false }
    end,
    opts = {
      diagnostics = {
        float = {
          focusable = true,
          border = "rounded",
          scope = "cursor",
          severity_sort = true,
          source = "if_many",
        },
      },
      inlay_hints = {
        enabled = false,
      },
    },
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        width = 0.6,
        height = 0.8,
      },
      ensure_installed = { "biome", "google-java-format" },
    },
  },
}
