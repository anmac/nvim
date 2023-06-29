local git = require("user.resources.git_icons").signcolumn

M = {
  signs = {
    add = { text = git.Add },
    change = { text = git.Change },
    delete = { text = git.Delete },
    topdelete = { text = git.Topdelete },
    changedelete = { text = git.Changedelete },
    untracked = { text = git.Untracked },
  },
  watch_gitdir = {
    interval = 100,
    follow_files = true,
  },
  attach_to_untracked = true,
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
}

return M
