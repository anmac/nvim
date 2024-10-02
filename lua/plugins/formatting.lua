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
        javascript = { "biome", "prettierd", stop_after_first = true },
        javascriptreact = { "biome", "prettierd", stop_after_first = true },
        json = { "biome", "prettierd", stop_after_first = true },
        jsonc = { "biome", "prettierd", stop_after_first = true },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        python = { "black" },
        scss = { "prettierd" },
        sh = { "shfmt" },
        typescript = { "biome", "prettierd", stop_after_first = true },
        typescriptreact = { "biome", "prettierd", stop_after_first = true },
        vue = { "prettierd" },
        yaml = { "prettierd" },
      },
      formatters = {
        shfmt = { prepend_args = { "-i", "2", "-ci", "-kp" } },
      },
    },
  },
}
