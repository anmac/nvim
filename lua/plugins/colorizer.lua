return {
  "NvChad/nvim-colorizer.lua",
  opts = function() return require("user.ui.colorizer") end,
  config = function(_, opts)
    local status_ok, colorizer = pcall(require, "colorizer")
    if not status_ok then
      vim.notify("Colorizer Plugin Failed!")
      return
    end
    colorizer.setup(opts)
  end,
}
