return {
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
      "nofile",
    },
    log_file_path = nil,
  },
  config = function(_, opts)
    require("tabnine").setup(opts)
  end
}
