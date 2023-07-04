return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "echasnovski/mini.bufremove", version = "*" },
  },
  opts = function() return require("user.ui.bufferline") end,
  config = function(_, opts)
    local status_ok, bufferline = pcall(require, "bufferline")
    if not status_ok then
      vim.notify("Bufferline Plugin Failed!")
      return
    end
    bufferline.setup(opts)
  end,
  cond = false,
}
