local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("bufferline failed!")
  return
end

bufferline.setup({
  options = {
    mode = "buffers",
    themable = true,
    close_command = function(n) require("mini.bufremove").delete(n, false) end,
    right_mouse_command = "vertical sbuffer %d",
    middle_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
    indicator = {
      icon = "┃",
      style = "icon",
    },
    close_icon = "",
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count)
      return "" .. count .. ""
    end,
    offsets = {
      { filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true, padding = 0 },
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "thin",
    hover = {
      enabled = true,
      delay = 50,
      reveal = { "close" },
    },
    sort_by = "insert_at_end",
  },
})
