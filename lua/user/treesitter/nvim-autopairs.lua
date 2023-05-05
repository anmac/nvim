local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("nvim-autopairs failed!")
  return
end

autopairs.setup({
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  disable_in_macro = true,
  disable_in_visualblock = false,
  disable_in_replace_mode = true,
  ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
  enable_moveright = true,
  enable_afterquote = true,
  enable_check_bracket_line = true,
  enable_bracket_in_quote = true,
  enable_abbr = false,
  break_undo = true,
  check_ts = true,
  map_cr = true,
  map_bs = true,
  map_c_h = false,
  map_c_w = false,
})