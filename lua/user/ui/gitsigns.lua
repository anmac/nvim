local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  vim.notify("gitsigns failed!")
  return
end

local git = require("user.resources.git_icons").signcolumn

gitsigns.setup({
  signs = {
    add = { text = git.Add },
    change = { text = git.Change },
    delete = { text = git.Delete },
    topdelete = { text = git.Topdelete },
    changedelete = { text = git.Changedelete },
    untracked = { text = git.Untracked },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 100,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = " <author>, <author_time:%R> - <summary>",
  preview_config = {
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
})
