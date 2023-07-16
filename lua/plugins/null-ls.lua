return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function() return require("user.null") end,
  config = function(_, opts)
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      vim.notify("Null-ls Plugin Failed!")
      return
    end
    null_ls.setup(opts)
  end,
}
