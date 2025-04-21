return {

  -- The official Neovim plugin for Supermaven
  {
    "supermaven-inc/supermaven-nvim",
    lazy = true,
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-e>",
      },
      ignore_filetypes = {
        ["DressingInput"] = true,
        ["fugitive"] = true,
        ["toggleterm"] = true,
        ["TelescopePrompt"] = true,
        ["neo-tree-popup"] = true,
        ["nofile"] = true,
      },
    },
  },
}
