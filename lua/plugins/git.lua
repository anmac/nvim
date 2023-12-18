return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree" }
    }
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git Status" }
    }
  },
}
