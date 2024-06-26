return {
  {
    "Exafunction/codeium.vim",
    config = function()
      vim.g.codeium_filetypes = {
        ["DressingInput"] = false,
        ["fugitive"] = false,
        ["toggleterm"] = false,
        ["TelescopePrompt"] = false,
        ["neo-tree-popup"] = false,
        ["nofile"] = false,
      }
      vim.api.nvim_set_hl(0, "Codeium", { fg = "#6fe8d7" })
    end,
  },
  {
    "codota/tabnine-nvim",
    build = "./dl_binaries.sh",
    enabled = false,
    opts = {
      disable_auto_comment = true,
      accept_keymap = "<Tab>",
      dismiss_keymap = "<C-]>",
      debounce_ms = 800,
      suggestion_color = { gui = "#808080", cterm = 244 },
      exclude_filetypes = {
        "DressingInput",
        "fugitive",
        "neo-tree",
        "NvimTree",
        "toggleterm",
        "TelescopePrompt",
        "neo-tree-popup",
        "nofile",
      },
      log_file_path = nil,
    },
    config = function(_, opts)
      require("tabnine").setup(opts)
      vim.api.nvim_set_hl(0, "Tabnine", { fg = "#cb43f0" })
    end,
  },
}
