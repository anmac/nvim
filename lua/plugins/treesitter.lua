return {

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "css",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "htmldjango",
        "http",
        "make",
        "php",
        "query",
        "scss",
        "sql",
        "ssh_config",
      })

      opts.highlights = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      }

      opts.textobjects = opts.textobjects or {}
      opts.textobjects.swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      }

      opts.autotag = { enable = true }

      return opts
    end,
  },

  -- autopairs for neovim
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- rainbow delimiters with treesitter
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
}
