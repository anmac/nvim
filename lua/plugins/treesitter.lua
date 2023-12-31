return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/playground",
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = function()
        return require("user.treesitter.nvim-treesitter-context")
      end,
      config = function(_, opts)
        local status_ok_context, context = pcall(require, "treesitter-context")
        if not status_ok_context then
          vim.notify("Treesitter-context Plugin Failed!")
          return
        end
        context.setup(opts)
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      init = function()
        load_textobjects = true
      end,
    },
    "mrjones2014/nvim-ts-rainbow",
    {
      "windwp/nvim-autopairs",
      opts = function()
        return require("user.treesitter.nvim-autopairs")
      end,
      config = function(_, opts)
        local status_ok_autopairs, autopairs = pcall(require, "nvim-autopairs")
        if not status_ok_autopairs then
          vim.notify("Nvim-Autopairs Plugin Failed!")
          return
        end
        autopairs.setup(opts)
      end,
    },
    "windwp/nvim-ts-autotag",
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = { enable_autocmd = false },
      config = function(_, opts)
        local status_ok_context_commentstring, ts_context_commentstring = pcall(require, "ts_context_commentstring")
        if not status_ok_context_commentstring then
          vim.notify("nvim-ts-context-commentstring Plugin Failed!")
          return
        end
        ts_context_commentstring.setup(opts)
      end,
      lazy = true,
    },
  },
  cmd = { "TSUpdateSync" },
  opts = function()
    return require("user.treesitter.nvim-treesitter")
  end,
  config = function(_, opts)
    local status_config_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
    if not status_config_ok then
      vim.notify("Nvim-Treesitter Plugin Failed!")
      return
    end
    treesitter_config.setup(opts)
  end,
}
