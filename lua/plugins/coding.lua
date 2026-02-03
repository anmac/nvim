return {

  -- Performant, batteries-included completion plugin for Neovim
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        keyword = { range = "prefix" },
        list = {
          selection = { preselect = true, auto_insert = false },
        },
      },
      sources = {
        default = function()
          local success, node = pcall(vim.treesitter.get_node)
          if
            success
            and node
            and vim.tbl_contains({ "comment", "line_comment", "block_comment", "comment_content" }, node:type())
          then
            return { "buffer" }
          else
            return { "lsp", "path", "snippets", "buffer" }
          end
        end,
      },
      keymap = {
        preset = "enter",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        -- ["<Tab>"] = { "snippet_forward", "fallback" },
        -- ["<S-Tab>"] = { "snippet_backward", "fallback" },
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

  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true,
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = false,
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
    opt = true,
    event = "InsertCharPre",
    priority = 1000,
  },
}
