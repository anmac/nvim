return {

  -- Performant, batteries-included completion plugin for Neovim
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    optional = true,
    config = function()
      -- require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip").filetype_extend("php", { "html" })
    end,
  },
}
