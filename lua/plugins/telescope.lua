return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-media-files.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "nvim-telescope/telescope-project.nvim" },
  },
  opts = function() return require("user.tools.telescope") end,
  config = function(_, opts)
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
      vim.notify("Telescope Plugin Failed!")
      return
    end
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("media_files")
    telescope.load_extension("file_browser")
    telescope.load_extension("project")
    telescope.load_extension("notify")
  end,
}
