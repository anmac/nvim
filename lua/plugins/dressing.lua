return   {
  "stevearc/dressing.nvim",
  lazy = true,
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require("lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.select(...)
    end
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      require("lazy").load({ plugins = { "dressing.nvim" } })
      return vim.ui.input(...)
    end
  end,
  opts = function() return require("user.ui.dressing") end,
  config = function(_, opts)
    local status_ok, dressing = pcall(require, "dressing")
    if not status_ok then
      vim.notify("Dressing Plugin Failed!")
      return
    end
    dressing.setup(opts)
  end,
}
