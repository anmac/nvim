return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = function() return require("user.ui.indentline") end,
  config = function(_, opts)
    local status_ok, indent_blankline = pcall(require, "indent_blankline")
    if not status_ok then
      vim.notify("Indent Blankline Plugin Failed!")
      return
    end
    indent_blankline.setup(opts)
  end,
}
