return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "VeryLazy" },
  init = function(plugin)
    require("lazy.core.loader").add_to_rtp(plugin)
    require("nvim-treesitter.query_predicates")
  end,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      config = function()
        local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
        local configs = require("nvim-treesitter.configs")
        for name, fn in pairs(move) do
          if name:find("goto") == 1 then
            move[name] = function(q, ...)
              if vim.wo.diff then
                local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                for key, query in pairs(config or {}) do
                  if q == query and key:find("[%]%[][cC]") then
                    vim.cmd("normal! " .. key)
                    return
                  end
                end
              end
              return fn(q, ...)
            end
          end
        end
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-context",
      enabled = true,
      opts = { mode = "cursor", max_lines = 3 },
    },
    { "windwp/nvim-ts-autotag" },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {},
    },
    { "HiPhish/nvim-ts-rainbow2" },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      lazy = true,
      opts = { enable_autocmd = false },
    },
  },
  keys = {
    { "<C-Space>", desc = "Increment selection" },
    { "<BS>", desc = "Decrement selection", mode = "x" },
  },
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "diff",
      "dockerfile",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "html",
      "htmldjango",
      "http",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "make",
      "markdown",
      "python",
      "query",
      "regex",
      "rust",
      "scss",
      "sql",
      "ssh_config",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    indent = { enable = true },
    highlight = {
      enable = true,
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-Space>",
        node_incremental = "<C-Space>",
        scope_incremental = false,
        node_decremental = "<BS>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = { query = "@function.outer", desc = "outer part of function" },
          ["if"] = { query = "@function.inner", desc = "inner part of function" },
          ["ac"] = { query = "@class.outer", desc = "outer part of class" },
          ["ic"] = { query = "@class.inner", desc = "inner part of class" },
        },
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<C-v>", -- blockwise
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
      },
    },
    autotag = { enable = true },
    rainbow = { enable = true, disable = { "html" } },
  },
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then
          return false
        end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end
    require("nvim-treesitter.configs").setup(opts)
  end,
}
