return {

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    opts = {
      auto_clean_after_session_restore = false,
      close_if_last_window = true,
      default_source = "last",
      source_selector = {
        winbar = true,
        show_scrolled_off_parent_node = true,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          { source = "git_status" },
          { source = "document_symbols" },
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
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
      },
      document_symbols = {
        follow_cursor = true,
        window = {
          mappings = {
            ["A"] = "noop",
            ["a"] = "noop",
          },
        },
        kinds = {
          Array = { icon = "", hl = "@type" },
          Boolean = { icon = "󰨙", hl = "@boolean" },
          Class = { icon = "", hl = "Structure" },
          Constant = { icon = "", hl = "@constant" },
          Constructor = { icon = "", hl = "@constructor" },
          Enum = { icon = "", hl = "@number" },
          EnumMember = { icon = "", hl = "@number" },
          Event = { icon = "", hl = "@constant" },
          Field = { icon = "", hl = "@field" },
          File = { icon = "󰈙", hl = "Tag" },
          Function = { icon = "", hl = "@function" },
          Interface = { icon = "", hl = "@type" },
          Method = { icon = "", hl = "@function" },
          Module = { icon = "", hl = "@module" },
          Namespace = { icon = "󰦮", hl = "@namespace" },
          Null = { icon = "", hl = "@constant" },
          Number = { icon = "󰎠", hl = "@number" },
          Operator = { icon = "", hl = "@operator" },
          Package = { icon = "󰏗", hl = "Label" },
          Parameter = { icon = "", hl = "@parameter" },
          Property = { icon = "", hl = "@property" },
          StaticMethod = { icon = "󰠄", hl = "Function" },
          String = { icon = "", hl = "@string" },
          Struct = { icon = "", hl = "@type" },
          TypeAlias = { icon = "", hl = "@type" },
          Variable = { icon = "", hl = "@variable" },
        },
      },
    },
  },

  -- which_key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["gs"] = { name = "+surround" },
        ["z"] = { name = "+fold" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader><tab>"] = { name = "+tabs" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>gh"] = { name = "+hunks" },
        ["<leader>q"] = { "<cmd>q<cr>", "Quit" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>u"] = { name = "+ui" },
        ["<leader>w"] = { "<cmd>w<cr>", "Save" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
