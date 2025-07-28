return {

  -- Fuzzy finder. Telescope
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     {
  --       "danielfalk/smart-open.nvim",
  --       branch = "0.2.x",
  --       dependencies = { "kkharji/sqlite.lua" },
  --       opts = { match_algorithm = "fzf" },
  --       keys = {
  --         {
  --           "<leader><space>",
  --           function()
  --             require("telescope").extensions.smart_open.smart_open()
  --           end,
  --           desc = "Smart Open",
  --         },
  --       },
  --     },
  --   },
  --   keys = {
  --     -- find
  --     { "<leader><space>", false },
  --     {
  --       "<leader>/",
  --       function()
  --         -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  --         require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
  --           winblend = 10,
  --           previewer = false,
  --         }))
  --       end,
  --       desc = "Fuzzily search in current buffer",
  --     },
  --     {
  --       "<C-p>",
  --       function()
  --         require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({
  --           initial_mode = "normal",
  --           previewer = false,
  --           sort_lastused = true,
  --           sort_mru = true,
  --         }))
  --       end,
  --       desc = "Buffers",
  --     },
  --     { "<leader>fG", ":copen | :silent :grep ", desc = "Ripgrep (include git-files)" },
  --     {
  --       "<leader>fn",
  --       function()
  --         require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
  --       end,
  --       desc = "[S]earch [N]eovim files",
  --     },
  --     -- git
  --     { "<leader>gt", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
  --   },
  --   opts = function(_, opts)
  --     local actions = require("telescope.actions")
  --     local action_layout = require("telescope.actions.layout")
  --
  --     opts.defaults = opts.defaults or {}
  --     opts.defaults.path_display = { "filename_first" }
  --
  --     if type(opts.defaults.mappings.i) == "table" then
  --       opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i, {
  --         ["<C-j>"] = actions.move_selection_next,
  --         ["<C-k>"] = actions.move_selection_previous,
  --         ["<C-u>"] = actions.preview_scrolling_up,
  --         ["<C-d>"] = actions.preview_scrolling_down,
  --         ["<C-h>"] = actions.preview_scrolling_left,
  --         ["<C-l>"] = actions.preview_scrolling_right,
  --         ["<M-p>"] = action_layout.toggle_preview,
  --       })
  --     end
  --
  --     if type(opts.defaults.mappings.n) == "table" then
  --       opts.defaults.mappings.n = vim.tbl_extend("force", opts.defaults.mappings.n, {
  --         ["<M-p>"] = action_layout.toggle_preview,
  --       })
  --     end
  --
  --     opts.extensions = {
  --       fzf = { fuzzy = false },
  --     }
  --   end,
  --   config = function(_, opts)
  --     local telescope = require("telescope")
  --     telescope.setup(opts)
  --     pcall(telescope.load_extension, "fzf")
  --     pcall(telescope.load_extension, "smart_open")
  --   end,
  -- },

  {
    "ibhagwan/fzf-lua",
    opts = {
      "hide",
      defaults = {
        formatter = "path.filename_first",
      },
      files = {
        find_opts = [[-type f \! -path '*/.git/*' \! -path '*/node_modules/*' \! -path '*/dist/*']],
        rg_opts = [[--color=never --hidden --files -g "!.git" -g "!node_modules" -g "!dist"]],
        fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude node_modules --exclude dist]],
      },
    },
    keys = {
      { "<leader>gt", "<cmd>FzfLua git_branches<cr>", desc = "Git Branches" },
    },
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
          { "<leader>gm", group = "+merge" },
        },
      },
    },
  },

  -- git signs highlights text that has changed since the list git commit
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>ghP", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk Popup" },
    },
    opts = {
      signs = {
        changedelete = { text = "" },
        untracked = { text = "┆" },
      },
      signs_staged = {
        changedelete = { text = "▎" },
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
      { "<leader>gB", "<cmd>Git blame<cr>", desc = "Git Blame Document" },
      -- { "<leader>gC", "<cmd>Git commit<cr>", desc = "Commit Changes" },
      { "<leader>gW", "<cmd>Gwrite!<cr>", desc = "Git Conflict: Choose The Whole File" },
      { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Write Git Changes" },
      { "<leader>gmL", "<cmd>Gvdiffsplit!<cr>", desc = "(Fugitive) Merge Conflicts Resolution" },
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
    keys = {
      { "<leader>gT", "<cmd>Flog<cr>", desc = "Git Commit Graph" },
    },
  },

  -- An interactive and powerful Git interface for Neovim, inspired by Magit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "sindrets/diffview.nvim", -- optional - Diff integration for any git rev
      keys = {
        { "<leader>gM", "<cmd>DiffviewOpen<cr>", desc = "(Diffview) Merge Conflict" },
      },
      opts = {
        view = { merge_tool = { layout = "diff3_mixed" } },
      },
    },
    keys = {
      { "<leader>gN", "<cmd>Neogit<cr>", desc = "Neogit Open" },
      { "<leader>gC", "<cmd>Neogit commit<cr>", desc = "Commit Changes" },
      { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Git Pull" },
      { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Git Push" },
    },
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
