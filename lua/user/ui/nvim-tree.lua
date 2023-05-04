local status_nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_nvim_tree_ok then
  vim.notify("nvim-tree setup failed")
  return
end

local status_lsp_file_operations_ok, lsp_file_operations = pcall(require, "lsp-file-operations")
if not status_lsp_file_operations_ok then
  vim.notify("lsp-file-operations failed")
  return
end
lsp_file_operations.setup()

local i = require("user.resources.documents_icons")
local git = require("user.resources.git_icons").file_explorer

nvim_tree.setup({
  disable_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = true,
  reload_on_bufenter = true,
  select_prompts = true,
  view = {
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = true,
    highlight_modified = "name",
    root_folder_label = ":t",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = i.Corner,
        edge = i.Edge,
        item = i.Item,
        bottom = i.Bottom,
        none = i.None,
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
      modified_placement = "after",
      padding = i.None,
      symlink_arrow = i.SymlinkArrow,
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = i.File,
        symlink = i.Symlink,
        bookmark = i.Bookmark,
        modified = i.Modified,
        folder = {
          arrow_closed = i.Arrow_closed,
          arrow_open = i.Arrow_open,
          default = i.Folder,
          open = i.OpenFolder,
          empty = i.EmptyFolder,
          empty_open = i.OpenEmptyFolder,
          symlink = i.SymlinkFolder,
          symlink_open = i.SymlinkFolder_open,
        },
        git = {
          unstaged = git.Unstaged,
          staged = git.Staged,
          unmerged = git.Unmerged,
          renamed = git.Renamed,
          untracked = git.Untracked,
          deleted = git.Delete,
          ignored = git.Ignored,
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      diagnostics = true,
      git = true,
    },
  },
})
