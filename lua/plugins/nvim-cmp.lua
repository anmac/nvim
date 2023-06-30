return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "hrsh7th/cmp-buffer", lazy = true },
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" },
      opts = {
        history = true,
        delete_check_events = "TextChanged",
      },
    },
    "ray-x/cmp-treesitter",
  },
  opts = function() return require("user.cmp") end,
  config = function(_, opts)
    require("cmp").setup(opts)
  end,
}
