return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
      "echasnovski/mini.bufremove",
      version = false,
      config = function()
        local status_ok_mini_bufremove, mini_bufremove = pcall(require, "mini.bufremove")
        if not status_ok_mini_bufremove then
          vim.notify("Minibufremove Plugin Failed!")
          return
        end
        mini_bufremove.setup({
          set_vim_settings = true,
          silent = true,
        })
      end,
    },
  },
  opts = function()
    return require("user.ui.bufferline")
  end,
  config = function(_, opts)
    local status_ok_bufferline, bufferline = pcall(require, "bufferline")
    if not status_ok_bufferline then
      vim.notify("Bufferline Plugin Failed!")
      return
    end
    bufferline.setup(opts)
  end,
  cond = function()
    if not vim.fn.exists(":Barbecue") == 2 then
      return false
    end
    return true
  end,
}
