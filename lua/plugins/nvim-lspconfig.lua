return {
  "neovim/nvim-lspconfig",
  branch = "master",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    { "williamboman/mason.nvim", cmd = "Mason", build = ":MasonUpdate" },
    { "williamboman/mason-lspconfig.nvim" },
    { "mfussenegger/nvim-jdtls" },
  },
  config = function()
    require("user.lsp")
  end,
}
