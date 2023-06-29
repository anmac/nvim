return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    { "MunifTanjim/nui.nvim", lazy = true },
    {
      "rcarriga/nvim-notify",
      opts = function() return require("user.ui.nvim-notify") end,
      config = function(_, opts)
        local status_ok, notify = pcall(require, "notify")
        if not status_ok then
          vim.notify("Notify Plugin Failed!")
          return
        end
        notify.setup(opts)
      end,
    },
  },
  opts = function() return require("user.ui.noice") end,
  config = function(_, opts)
    local status_ok, noice = pcall(require, "noice")
    if not status_ok then
      vim.notify("Noice Plugin Failed!")
      return
    end
    noice.setup(opts)
  end,
}
