return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "MunifTanjim/nui.nvim", lazy = true },
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File Explorer" },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git explorer",
    },
    {
      "<leader>be",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end,
      desc = "Buffer explorer",
    },
  },
  opts = {
    close_if_last_window = true,
    default_source = "last",
    log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
    log_to_file = false,
    source_selector = {
      winbar = true,
      show_scrolled_off_parent_node = true,
      content_layout = "center",
    },
    default_component_configs = {
      diagnostics = {
        symbols = { hint = "" }
      },
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
      use_libuv_file_watcher = true,
    },
  },
  config = function(_, opts)
    local neo_tree = require("neo-tree")
    neo_tree.setup(opts)
  end,
}
