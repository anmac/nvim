return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return require("user.ui.gitsigns")
    end,
    config = function(_, opts)
      local status_ok_gitsigns, gitsigns = pcall(require, "gitsigns")
      if not status_ok_gitsigns then
        vim.notify("Gitsigns Plugin Failed!")
        return
      end
      gitsigns.setup(opts)
      local status_ok_scrollbar, scrollbar = pcall(require, "scrollbar.handlers.gitsigns")
      if not status_ok_scrollbar then
        vim.notify("Gitsigns Plugin Failed!")
        return
      end
      scrollbar.setup()
      vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#6d707c]])
      vim.cmd([[highlight GitSignsChange guifg=#D0B172]])
    end,
  },
  { "tpope/vim-fugitive" },
  { "mbbill/undotree" },
}
