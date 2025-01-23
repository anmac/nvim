return {
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          })
        end,
        mode = { "n", "v" },
        desc = "Format File or Range",
      },
    },
    opts = {
      formatters_by_ft = {
        -- ["markdown.mdx"] = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        java = { "google-java-format" },
        javascript = { "biome", "prettierd", stop_after_first = true },
        javascriptreact = { "biome", "prettierd", stop_after_first = true },
        json = { "biome", "prettierd", stop_after_first = true },
        jsonc = { "biome", "prettierd", stop_after_first = true },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        -- php = { "phpcbf", "php_cs_fixer", stop_after_first = true },
        scss = { "prettierd" },
        typescript = { "biome", "prettierd", stop_after_first = true },
        typescriptreact = { "biome", "prettierd", stop_after_first = true },
        yaml = { "prettierd" },
        zsh = { "beautysh" },
        ["_"] = { "trim_whitespace" },
      },
      formatters = {
        shfmt = { prepend_args = { "-i", "2", "-ci", "-kp" } },
        stylua = {
          prepend_args = {
            "--column-width",
            "120",
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
            "--quote-style",
            "AutoPreferDouble",
            "--sort-requires",
          },
        },
      },
    },
  },
}
