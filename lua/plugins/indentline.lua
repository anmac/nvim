return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    return require("user.ui.indentline")
  end,
  config = function(_, opts)
    local status_ok, ibl = pcall(require, "ibl")
    if not status_ok then
      vim.notify("Indent Blankline Plugin Failed!")
      return
    end
    ibl.setup(opts)
  end,
}
