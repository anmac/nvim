return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = function() return require("user.ui.gitsigns") end,
  config = function(_, opts)
    local status_ok, gitsigns = pcall(require, "gitsigns")
    if not status_ok then
      vim.notify("Gitsigns Plugin Failed!")
      return
    end
    gitsigns.setup(opts)
  end,
}
