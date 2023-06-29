return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function() return require("user.ui.lualine") end,
  config = function(_, opts)
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
      vim.notify("Lualine Plugin Failed!")
      return
    end
    lualine.setup(opts)
  end,
}
