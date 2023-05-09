local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
  vim.notify("trouble failed!")
  return
end

trouble.setup({
  position = "bottom",
  height = 10,
  icons = true,
  mode = "workspace_diagnostics",
  fold_open = "",
  fold_closed = "",
  group = true,
  padding = true,
  action_keys = {
    close = "q",
    cancel = "<esc>",
    refresh = "r",
    jump = {"<CR>", "<tab>"},
    open_split = { "<C-x>" },
    open_vsplit = { "<C-v>" },
    open_tab = { "<C-t>" },
    jump_close = {"o"},
    toggle_mode = "m",
    toggle_preview = "P",
    hover = "K",
    preview = "p",
    close_folds = {"zM", "zm"},
    open_folds = {"zR", "zr"},
    toggle_fold = {"zA", "za"},
    previous = "k",
    next = "j"
  },
  indent_lines = true,
  auto_open = false,
  auto_close = false,
  auto_preview = true,
  auto_fold = false,
  auto_jump = {"lsp_definitions"},
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = ""
  },
  use_diagnostic_signs = true,
})
