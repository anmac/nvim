return {
  "LunarVim/bigfile.nvim",
  {
    "szw/vim-maximizer",
    keys = {
      { "<C-m>", "<cmd>MaximizerToggle!<cr>", mode = { "n", "x" }, desc = "Toggle maximize buffer" }
    }
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("ufo").setup()
    end
  },
  {
    "rmagatti/auto-session",
    enabled = false,
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_enable_last_session = false,
        auto_session_suppress_dirs = {
          "~/",
          "~/Applications",
          "~/Desktop",
          "~/Documents",
          "~/Documents/*",
          "~/Downloads",
          "~/Music",
          "~/Pictures",
          "~/Videos",
          "~/Projects",
          "/"
        },
        session_lens = {
          buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      })

      vim.keymap.set("n", "<leader>fa", require("auto-session.session-lens").search_session, {
        noremap = true,
        desc = "Search Session"
      })
    end
  }
}
