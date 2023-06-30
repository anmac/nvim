local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  vim.notify("Telescope Plugin Failed!")
  return
end

local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions
local project_actions = telescope.extensions.project.actions

local icons = require("user.resources.misc_icons").ui_v2

M = {
  defaults = {
    sorting_strategy = "descending",
    selection_strategy = "reset",
    scroll_strategy = "cycle",
    layout_strategy = "horizontal",
    prompt_prefix = icons.Prompt .. " ",
    selection_caret = icons.Selection,
    initial_mode = "insert",
    border = true,
    path_display = { "smart" },
    cache_picker = false,
    history = {
      path = "~/.local/share/nvim/telescope_history",
      limit = 100,
    },
    file_ignore_patterns = {
      ".git/",
      ".github/",
      "node_modules/",
      "target/",
      "docs/",
      "env/",
      "vendor/*",
      ".idea/",
      ".settings/",
      ".vscode/",
      "%.lock",
      "%.sqlite3",
      "%.ipynb",
      "%.svg",
      "%.otf",
      "%.ttf",
      "%.webp",
      "__pycache__/*",
      ".dart_tool/",
    },
    mappings = {
      i = {
        ["<M-n>"] = actions.cycle_history_next,
        ["<M-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<PageDown>"] = actions.preview_scrolling_down,
        ["<PageUp>"] = actions.preview_scrolling_up,
        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.file_split,
        ["<C-v>"] = actions.file_vsplit,
        ["<C-t>"] = actions.select_tab,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-c>"] = actions.close,
        ["<C-/>"] = actions.which_key,
      },
      n = {
        ["<M-n>"] = actions.cycle_history_next,
        ["<M-p>"] = actions.cycle_history_prev,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<PageDown>"] = actions.preview_scrolling_down,
        ["<PageUp>"] = actions.preview_scrolling_up,
        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.file_split,
        ["<C-v>"] = actions.file_vsplit,
        ["<C-t>"] = actions.select_tab,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<Esc>"] = actions.close,
        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    grep_string = {
      grep_open_files = true,
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    git_files = {
      show_untracked = true,
    },
    builtin = {
      include_extensions = true,
    },
    planets = {
      show_pluto = true,
      show_moon = true,
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
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "pdf", "webm" },
      find_cmd = "rg"
    },
    file_browser = {
      grouped = true,
      hidden = true,
      theme = "ivy",
      mappings = {
        i = {
          ["<M-c>"] = fb_actions.create,
          ["<S-CR>"] = fb_actions.create_from_prompt,
          ["<M-r>"] = fb_actions.rename,
          ["<M-m>"] = fb_actions.move,
          ["<M-y>"] = fb_actions.copy,
          ["<M-d>"] = fb_actions.remove,
          ["<C-o>"] = fb_actions.open,
          ["<C-p>"] = fb_actions.goto_parent_dir,
          ["<C-e>"] = fb_actions.goto_home_dir,
          ["<C-w>"] = fb_actions.goto_cwd,
          ["<C-t>"] = fb_actions.change_cwd,
          ["<C-f>"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["<C-s>"] = fb_actions.toggle_all,
          ["<BS>"] = fb_actions.backspace,
        },
        n = {
          ["a"] = fb_actions.create,
          ["r"] = fb_actions.rename,
          ["x"] = fb_actions.move,
          ["c"] = fb_actions.copy,
          ["d"] = fb_actions.remove,
          ["o"] = fb_actions.open,
          ["l"] = fb_actions.open,
          ["p"] = fb_actions.goto_parent_dir,
          ["h"] = fb_actions.goto_parent_dir,
          ["e"] = fb_actions.goto_home_dir,
          ["w"] = fb_actions.goto_cwd,
          ["t"] = fb_actions.change_cwd,
          ["f"] = fb_actions.toggle_browser,
          ["<C-h>"] = fb_actions.toggle_hidden,
          ["s"] = fb_actions.toggle_all,
        },
      },
    },
    symbols = {
      sources = { "emoji", "kaomoji", "gitmoji" },
    },
    project = {
      base_dirs = {
        { "~/Workspace", max_depth = 4 },
      },
      hidden_files = true,
      order_by = "recent",
      search_by = "title",
      sync_with_nvim_tree = true,
      on_project_selected = function(prompt_bufnr)
        project_actions.change_working_directory(prompt_bufnr, false)
        require("harpoon.ui").nav_file(1)
      end,
      theme = "dropdown",
    },
  },
}

return M
