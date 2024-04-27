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
      window = { border = "rounded" },
      layout = { align = "center" },
      defaults = {
        mode = { "n", "v" },
        ["<leader>q"] = { "<cmd>q<cr>", "Quit" },
        ["<leader>w"] = { "<cmd>w<cr>", "Save" },
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
        untracked = { text = "┃" },
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
      },
      current_line_blame_formatter_opts = { relative_time = true },
      preview_config = { border = "rounded" },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "]h", function()
          gs.nav_hunk("next")
        end, "Next Hunk")
        map("n", "[h", function()
          gs.nav_hunk("prev")
        end, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", gs.blame_line, "Blame Line")
        map("n", "<leader>ghB", function()
          gs.blame_line({ full = true })
        end, "Blame Line Full")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function()
          gs.diffthis("~")
        end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#6d707c]])
      end,
    },
  },

  -- Fugitive: A git wrapper so awesome, it should be illegal
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gB", "<cmd>Git blame<cr>", desc = "Blame Document" },
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

  -- vim-illuminate
  {
    "RRethy/vim-illuminate",
    opts = {
      filetypes_denylist = {
        "alpha",
        "dapui_scopes",
        "dapui_breakpoints",
        "dapui_stacks",
        "dapui_watches",
        "dap-repl",
        "dap-terminal",
        "dapui_console",
        "dashboard",
        "dirbuf",
        "dirvish",
        "DressingInput",
        "fugitive",
        "git",
        "harpoon",
        "help",
        "lazy",
        "lspinfo",
        "Man",
        "man",
        "mason",
        "Markdown",
        "NvimTree",
        "neo-tree",
        "neo-tree-popup",
        "notify",
        "packer",
        "spectre_panel",
        "startify",
        "toggleterm",
        "trouble",
        "TelescopePrompt",
        "TelescopeResult",
      },
      modes_allowlist = { "n", "i" },
    },
  },
}
