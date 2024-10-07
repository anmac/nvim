return {

  -- The official Neovim plugin for Supermaven
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
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
