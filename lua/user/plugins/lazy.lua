local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Core plugins
  "nvim-lua/plenary.nvim",
  "folke/neodev.nvim",

  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  -- Treesitter
  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/playground",
      "mrjones2014/nvim-ts-rainbow",
    }
  },

  -- UI
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "antosha417/nvim-lsp-file-operations",
    },
  },
}

local opts = {
  defaults = {
    version = "*",
  },
  ui = {
    border = "rounded",
  }
}

require("lazy").setup(plugins, opts)
