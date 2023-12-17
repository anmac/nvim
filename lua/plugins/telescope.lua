return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = vim.fn.executable("make") == 1,
    },
  },
  keys = function()
    local builtin = require("telescope.builtin")
    return {
      { "<leader>ff", builtin.find_files, desc = "Find File" },
      { "<leader>fg", builtin.live_grep, desc = "Live Grep" },
      { "<leader>fb", builtin.buffers, desc = "Buffers" },
      { "<leader>fm", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon Marks" },
    }
  end,
  opts = function()
    local actions = require("telescope.actions")
    return {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        cache_picker = false,
        file_ignore_patterns = {
          "%.ipynb",
          "%.lock",
          "%.otf",
          "%.sqlite3",
          "%.svg",
          "%.ttf",
          "%.webp",
          ".dart_tool/",
          ".git/",
          ".github/",
          ".idea/",
          ".settings/",
          ".vscode/",
          "__pycache__/*",
          "docs/",
          "env/",
          "node_modules/",
          "target/",
          "vendor/*",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-h>"] = actions.preview_scrolling_left,
            ["<C-l>"] = actions.preview_scrolling_right,
          },
          n = {
            ["q"] = actions.close,
          },
        },
      },
      pickers = {
        live_grep = {
          theme = "ivy",
        },
        grep_string = {
          theme = "ivy",
        },
        git_files = {
          show_untracked = true,
        },
        builtin = {
          include_extensions = true,
        },
        buffers = {
          sort_mru = true,
          theme = "dropdown",
          previewer = false,
        },
      },
      extensions = {
        fzf = {
          fuzzy = false,
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("harpoon")
  end
}
