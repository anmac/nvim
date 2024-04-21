return {
  "LunarVim/bigfile.nvim",
  {
    "szw/vim-maximizer",
    keys = {
      { "<C-m>", "<cmd>MaximizerToggle!<cr>", mode = { "n", "x" }, desc = "Toggle maximize buffer" },
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("ufo").setup()
    end,
  },
  -- { "tpope/vim-sleuth" },
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
  {
    "stevearc/aerial.nvim",
    keys = {
      { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Toggle Aerial" },
    },
    opts = {
      close_automatic_events = { "unsupported" },
      autojump = false,
      manage_folds = true,
      link_folds_to_tree = true,
      link_tree_to_folds = true,
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
      show_guides = true,
    },
  },
}
