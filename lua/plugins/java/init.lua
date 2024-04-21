return {
  "nvim-java/nvim-java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
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
            --   local lspconfig = require("lspconfig")
            --   lspconfig.jdtls.setup({
            --     settings = {
            --       java = {
            --         configuration = {
            --           runtimes = {
            --             {
            --               name = "JavaSE-22",
            --               path = "/usr/lib/jvm/java-22-openjdk",
            --               default = true,
            --             },
            --           },
            --         },
            --       },
            --     },
            --   })
            require("java").setup()
          end,
        },
      },
    },
  },
  opts = {
    java_test = {
      enable = false,
    },
    java_debug_adapter = {
      enable = false,
    },
    jdk = {
      auto_install = false,
    },
    notifications = {
      dap = false,
    },
  },
  -- config = function(_, opts)
  --   require("java").setup(opts)
  -- end,
}
