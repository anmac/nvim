return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function() return require("user.tools.which-key") end,
  config = function(_, opts)
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
      vim.notify("Which-Key Plugin Failed!")
      return
    end
    which_key.setup(opts)
  end,
}
