return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  opts = function() return require("user.tools.vim-illuminate") end,
  config = function(_, opts) 
    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
      vim.notify("Illuminate Plugin Failed!")
      return
    end
    illuminate.configure(opts)
  end,
}
