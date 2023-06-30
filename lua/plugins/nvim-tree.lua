return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
      "antosha417/nvim-lsp-file-operations",
      config = function()
        local status_lsp_file_operations_ok, lsp_file_operations = pcall(require, "lsp-file-operations")
        if not status_lsp_file_operations_ok then
          vim.notify("Lsp-File-Operations Plugin Failed!")
          return
        end
        lsp_file_operations.setup()
      end,
    },
  },
  opts = function() return require("user.ui.nvim-tree") end,
  config = function(_, opts)
    local status_nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
    if not status_nvim_tree_ok then
      vim.notify("Nvim-Tree Plugin Failed!")
      return
    end
    nvim_tree.setup(opts)
  end,
}
