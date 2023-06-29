return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  opts = function() return require("user.ui.comment") end,
  config = function(_, opts)
    local satus_ok, comment = pcall(require, "Comment")
    if not satus_ok then
      vim.notify("Comment Plugin Failed!")
      return
    end
    comment.setup(opts)
  end,
}
