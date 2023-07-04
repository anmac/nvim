return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = function() return require("user.ui.barbecue") end,
  config = function(_, opts)
    local status_ok, barbecue = pcall(require, "barbecue")
    if not status_ok then
      vim.notify("Barbecue Plugin Failed!")
      return
    end
    barbecue.setup(opts)
  end,
}
