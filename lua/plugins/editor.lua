return {

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      default_source = "last",
      source_selector = {
        winbar = true,
        show_scrolled_off_parent_node = true,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
        },
        content_layout = "center",
      },
      default_component_configs = {
        container = { enable_character_fade = false },
        diagnostics = { symbols = { hint = "" } },
        name = { use_git_status_colors = true },
        file_size = { enabled = false },
        type = { enabled = false },
        last_modified = { enabled = false },
        symlink_target = { enabled = true },
      },
      window = {
        same_level = true,
        insert_as = "child",
        mappings = {
          ["<space>"] = "noop",
          ["s"] = "open_split",
          ["S"] = "noop",
          ["v"] = "open_vsplit",
          ["a"] = {
            "add",
            config = {
              show_path = "relative",
            },
          },
          ["A"] = {
            "add_directory",
            config = {
              show_path = "relative",
            },
          },
          ["Z"] = "expand_all_nodes",
        },
      },
      filesystem = {
        window = {
          fuzzy_finder_mappings = {
            ["<C-j>"] = "move_cursor_down",
            ["<C-k>"] = "move_cursor_up",
          },
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = { ".git" },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
    },
  },

  -- Fuzzy finder. Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "danielfalk/smart-open.nvim",
        branch = "0.2.x",
        dependencies = { "kkharji/sqlite.lua" },
        opts = { match_algorithm = "fzf" },
        keys = {
          {
            "<leader><space>",
            function()
              require("telescope").extensions.smart_open.smart_open()
            end,
            desc = "Smart Open",
          },
        },
      },
    },
    keys = {
      { "<leader>/", false },
      { "<leader><space>", false },
      -- find
      {
        "<C-p>",
        function()
          require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({
            initial_mode = "normal",
            previewer = false,
            sort_lastused = true,
            sort_mru = true,
          }))
        end,
        desc = "Buffers",
      },
      {
        "<leader>\\",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
            winblend = 10,
            previewer = true,
          }))
        end,
        desc = "Fuzzily search in current buffer",
      },
      { "<leader>fG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- git
      { "<leader>gt", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
    },
    opts = function(_, opts)
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")

      opts.defaults = opts.defaults or {}
      opts.defaults.path_display = { "filename_first" }

      if type(opts.defaults.mappings.i) == "table" then
        opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i, {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,
          ["<C-h>"] = actions.preview_scrolling_left,
          ["<C-l>"] = actions.preview_scrolling_right,
          ["<M-p>"] = action_layout.toggle_preview,
        })
      end

      if type(opts.defaults.mappings.n) == "table" then
        opts.defaults.mappings.n = vim.tbl_extend("force", opts.defaults.mappings.n, {
          ["<M-p>"] = action_layout.toggle_preview,
        })
      end

      opts.extensions = {
        fzf = { fuzzy = false },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "smart_open")
    end,
  },

  -- which_key
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
      delay = 300,
      plugins = { spelling = true },
      layout = { align = "center" },
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>q", "<cmd>q<cr>", desc = "Quit" },
          { "<leader>w", "<cmd>w<cr>", desc = "Save" },
          { "<leader>gm", group = "+merge" },
        },
      },
    },
  },

  -- git signs highlights text that has changed since the list git commit
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "" },
        untracked = { text = "┆" },
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = { delay = 500 },
      preview_config = { border = "rounded" },
    },
  },

  -- Fugitive: A git wrapper so awesome, it should be illegal
  {
    "tpope/vim-fugitive",
    event = "BufEnter",
    keys = {
      { "<leader>gB", "<cmd>Git blame<cr>", desc = "Blame Document" },
      { "<leader>gC", "<cmd>Git commit<cr>", desc = "Commit Changes" },
      { "<leader>gW", "<cmd>Gwrite!<cr>", desc = "Git Conflict: Choose The Whole File" },
      { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Write Git Changes" },
      { "<leader>gmL", "<cmd>Gvdiffsplit!<cr>", desc = "Merge Conflicts Resolution" },
    },
  },

  -- A blazingly fast git branch viewer
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },

  -- Visualize and resolve Git conflicts
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    dependencies = {
      {
        "yorickpeterse/nvim-pqf",
        config = function()
          require("pqf").setup()
        end,
      },
    },
    keys = {
      { "<leader>gml", "<cmd>GitConflictListQf<cr>", desc = "Git Merge List" },
    },
    opts = {
      disable_diagnostics = true,
    },
    config = function(_, opts)
      require("git-conflict").setup(opts)
      vim.cmd([[highlight DiffAdd guibg=#405d7e]])
      vim.cmd([[highlight DiffText guibg=#314753]])
    end,
  },

  -- the undo history visualizer for VIM
  {
    "mbbill/undotree",
    init = function()
      vim.cmd([[
      let g:undotree_WindowLayout = 3
      let g:undotree_SetFocusWhenToggle = 1
      ]])
    end,
    keys = {
      { "<leader>gu", vim.cmd.UndotreeToggle, desc = "UndoTree" },
    },
  },
}
