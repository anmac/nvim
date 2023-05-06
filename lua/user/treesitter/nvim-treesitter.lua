local status_config_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status_config_ok then
  vim.notify("nvim-treesitter.configs failed!")
  return
end

local status_install_ok, treesitter_install = pcall(require, "nvim-treesitter.install")
if not status_install_ok then
  vim.notify("nvim-treesitter.install failed!")
  return
end
treesitter_install.prefer_git = true

treesitter_config.setup({
  ensure_installed = "all",
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  indent = { enable = true },
  autotag = { enable = true },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-Space>",
      node_incremental = "<C-Space>",
      scopc_incremental = false,
      node_decremental = "<BS>",
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  rainbow = {
    enable = true,
    disable = { "html" },
    extended_mode = false,
  },
})
