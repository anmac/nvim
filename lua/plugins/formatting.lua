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
        ["markdown.mdx"] = { "prettierd" },
        bash = { "shfmt" },
        css = { "prettierd" },
        fish = { "fish_indent" },
        graphql = { "prettierd" },
        handlebars = { "prettierd" },
        html = { "prettierd" },
        java = { "google-java-format" },
        javascript = { { "biome", "prettierd" } },
        javascriptreact = { { "biome", "prettierd" } },
        json = { { "biome", "prettierd" } },
        jsonc = { { "biome", "prettierd" } },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        python = { "black" },
        scss = { "prettierd" },
        sh = { "shfmt" },
        typescript = { { "biome", "prettierd" } },
        typescriptreact = { { "biome", "prettierd" } },
        vue = { "prettierd" },
        yaml = { "prettierd" },
      },
      formatters = {
        shfmt = { prepend_args = { "-i", "2", "-ci", "-kp" } },
      },
    },
  },
}
