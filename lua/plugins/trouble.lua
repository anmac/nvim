return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  event = "VeryLazy",
  opts = function() return require("user.tools.trouble") end,
  config = function(_, opts)
    local status_ok, trouble = pcall(require, "trouble")
    if not status_ok then
      vim.notify("Trouble Plugin Failed!")
      return
    end
    trouble.setup(opts)
  end,
}
