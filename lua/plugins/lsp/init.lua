return {

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[9] = { "<c-K>", false }
    end,
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

  -- support for file operations using built-in LSP
  {
    "antosha417/nvim-lsp-file-operations",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
