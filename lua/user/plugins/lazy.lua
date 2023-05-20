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
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "mrjones2014/nvim-ts-rainbow",
      "windwp/nvim-autopairs",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    }
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      { "williamboman/mason.nvim", cmd = "Mason", build = ":MasonUpdate" },
      { "williamboman/mason-lspconfig.nvim" },
    },
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "hrsh7th/cmp-buffer", lazy = true },
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      {
        "L3MON4D3/LuaSnip",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
      },
      "ray-x/cmp-treesitter",
    },
  },

  -- AI
  { "codota/tabnine-nvim", build = "./dl_binaries.sh" },

  -- UI
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "antosha417/nvim-lsp-file-operations",
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
      "echasnovski/mini.bufremove",
    }
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
  },
  { "NvChad/nvim-colorizer.lua" },
  {
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
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      { "MunifTanjim/nui.nvim", lazy = true },
      "rcarriga/nvim-notify",
    },
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Tools: Telescope, nvim-spectre, Whichkey, TODO-comments, Trouble, vim-illuminate, Comment
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-symbols.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
    },
  },
  { "nvim-pack/nvim-spectre" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    event = "VeryLazy",
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
  },
}

local opts = {
  defaults = {
    lazy = true,
    version = "*",
  },
  ui = {
    border = "rounded",
  }
}

require("lazy").setup(plugins, opts)
