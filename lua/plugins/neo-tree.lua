local Util = require("util")

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
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
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
    auto_clean_after_session_restore = false,
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
      container = { enable_character_fade = false },
      diagnostics = {
        symbols = { hint = "" },
      },
      indent = { with_expanders = true },
      name = { use_git_status_colors = false },
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
        ["w"] = "open",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "copy path to clipboard",
        },
        ["Z"] = "expand_all_nodes",
      },
    },
    filesystem = {
      bind_to_cwd = false,
      window = {
        fuzzy_finder_mappings = {
          ["<down>"] = "move_cursor_down",
          ["<C-j>"] = "move_cursor_down",
          ["<up>"] = "move_cursor_up",
          ["<C-k>"] = "move_cursor_up",
        },
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      use_libuv_file_watcher = true,
    },
  },
  config = function(_, opts)
    local function on_move(data)
      Util.lsp.on_rename(data.source, data.destination)
    end

    local function git_refresh()
      require("neo-tree.sources.git_status").refresh()
    end

    local events = require("neo-tree.events")
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
      { event = events.GIT_EVENT, handler = git_refresh },
      { event = events.GIT_STATUS_CHANGED, handler = git_refresh },
    })
    local neo_tree = require("neo-tree")
    neo_tree.setup(opts)

    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = git_refresh,
    })
  end,
}
