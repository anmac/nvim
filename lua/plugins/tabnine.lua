return {
  "codota/tabnine-nvim",
  build = "./dl_binaries.sh",
  opts = function() return require("user.tools.tabnine") end,
  config = function(_, opts) 
    local tabnine_status_ok, tabnine = pcall(require, "tabnine")
    if not tabnine_status_ok then
      vim.notify("Tabnine Plugin Failed!")
      return
    end
    tabnine.setup(opts)
  end,
}
