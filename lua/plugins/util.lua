return {

  -- auto-session. A small automated session manager for Neovim
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = {
          "~/",
          "~/Applications",
          "~/Desktop",
          "~/Documents",
          "~/Downloads",
          "~/Music",
          "~/Pictures",
          "~/Projects",
          "~/Videos",
          "/",
        },
        session_lens = {
          buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      })
      vim.keymap.set(
        "n",
        "<leader>fs",
        require("auto-session.session-lens").search_session,
        { noremap = true, desc = "Search Session" }
      )
    end,
  },

  -- modern fold look keeping high performance
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("ufo").setup()
    end,
  },

  -- Automatically adjusts 'shiftwidth' and 'expandtab'
  { "tpope/vim-sleuth" },

  -- seamless navigation between tmux panes and vim splits
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
