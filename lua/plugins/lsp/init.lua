return {

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[9] = { "<c-K>", false }
    end,
    opts = function(_, opts)
      opts.diagnostics.float = {
        focusable = true,
        border = "rounded",
        scope = "cursor",
        serverity_sort = true,
        source = "if_many",
      }
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })
    end,
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ui = {
        border = "rounded",
        width = 0.6,
        height = 0.8,
      }
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "biome", "google-java-format" })
    end,
  },

  -- support for file operations using built-in LSP
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
