return {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-refactor",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            autostart = true,
            filetypes = { "java", "jsp" },
            single_file_support = true,
            handlers = {
              ["$/progress"] = function() end,
            },
            on_attach = function()
              vim.lsp.codelens.refresh()
            end,
            capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
          },
        },
      },
    },
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        handlers = {
          ["jdtls"] = function()
            require("java").setup({
              jdk = { auto_install = false },
            })
          end,
        },
      },
    },
  },
}
