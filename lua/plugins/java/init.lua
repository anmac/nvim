return {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
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
            require("java").setup()
          end,
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          jdtls = {
            handlers = {
              ["$/progress"] = function() end,
            },
          },
        },
      },
    },
  },
  opts = {
    java_debug_adapter = { enable = true },
    jdk = { auto_install = false },
    notifications = { dap = false },
  },
}