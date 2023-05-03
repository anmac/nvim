local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  vim.notify("Indent blankline failed!")
  return
end

indent_blankline.setup({
  char = "▏",
  char_list_blankline = {},
  char_highlight_list = {},
  space_char_blankline = " ",
  space_char_highlight_list = {},
  space_char_blankline_highlight_list = {},
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  show_end_of_line = false,
  show_foldtext = false,
  filetype_exclude = {
    "checkhealth",
    "dashboard",
    "fugitive",
    "help",
    "man",
    "lazy",
    "lspinfo",
    "packer",
    "Markdown",
    "neogitstatus",
    "NvimTree",
    "startify",
    "Trouble",
    "toggleterm",
    "",
  },
  buftype_exclude = { "terminal", "nofile", "quickfix", "prompt", "nvimtree" },
  show_current_context = true,
  show_current_context_start = false,
  show_current_context_start_on_current_line = true,
  context_char = "▏",
  context_char_list = {},
  context_char_list_blankline = {},
  context_highlight_list = {
    "rainbowcol1",
    "rainbowcol2",
    "rainbowcol3",
    "rainbowcol4",
    "rainbowcol5",
    "rainbowcol6",
    "rainbowcol7",
  },
})
