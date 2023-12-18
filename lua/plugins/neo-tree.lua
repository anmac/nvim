return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" }
  },
  opts = {
    close_if_last_window = true,
    log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
    log_to_file = false,
    source_selector = {
      winbar = true,
      show_scrolled_off_parent_node = true,
      content_layout = "center",
    },
    default_component_configs = {
      name = { use_git_status_colors = false },
      file_size = { enabled = false },
      type = { enabled = false },
      last_modified = { enabled = false },
    },
    window = {
      same_level = true,
      insert_as = "sibling",
      mappings = {
        ["<space>"] = "noop",
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
      },
    },
    filesystem = {
      window = {
        fuzzy_finder_mappings = {
          ["<down>"] = "move_cursor_down",
          ["<C-j>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-k>"] = "move_cursor_up",
        },
      },
      group_empty_dirs = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },
  },
  config = function(_, opts)
    local neo_tree = require("neo-tree")
    neo_tree.setup(opts)
  end,
}
