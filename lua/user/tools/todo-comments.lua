local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  vim.notify("todo-comments failed!")
  return
end

local i = require("user.resources.misc").ui_v2

todo_comments.setup({
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      icon = i.Bug,
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = { icon = i.Check, color = "info" },
    HACK = { icon = i.Fire, color = "warning" },
    WARN = { icon = i.Warning, color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = i.Dahsboard, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = i.Note, color = "hint", alt = { "INFO" } },
    TEST = { icon = i.Test, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  gui_style = {
    fg = "NONE",
    bg = "BOLD",
  },
  merge_keywords = true,
  highlight = {
    multiline = true,
    multiline_pattern = "^.",
    multiline_context = 10,
    before = "fg",
    keyword = "wide",
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 400,
    exclude = { "man", "help", "terminal", "alpha" },
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" }
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    pattern = [[\b(KEYWORDS):]],
  },
})
