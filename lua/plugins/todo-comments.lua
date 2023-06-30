return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  opts = function() return require("user.tools.todo-comments") end,
  config = function(_, opts)
    local status_ok, todo_comments = pcall(require, "todo-comments")
    if not status_ok then
      vim.notify("Todo-comments Plugin Failed!")
      return
    end
    todo_comments.setup(opts)
  end,
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
  }
}
