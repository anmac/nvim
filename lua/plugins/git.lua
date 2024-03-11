local Util = require("util")

return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree" },
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gf", vim.cmd.Git, desc = "Fugitive" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "" },
        untracked = { text = "┃" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = " <author>, <author_time:%R> - <summary>",
      preview_config = { border = "rounded" },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function keymap(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        keymap("n", "]h", gs.next_hunk, "Next Hunk")
        keymap("n", "[h", gs.prev_hunk, "Prev Hunk")
        keymap({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        keymap({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        keymap("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        keymap("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        keymap("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        keymap("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        keymap("n", "<leader>ghb", function()
          gs.blame_line()
        end, "Blame Line")
        keymap("n", "<leader>ghB", function()
          gs.blame_line({ full = true })
        end, "Blame Line Full")
        keymap("n", "<leader>ghd", gs.diffthis, "Diff This")
        keymap("n", "<leader>ghD", function()
          gs.diffthis("~")
        end, "Diff This ~")
        keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#6d707c]])
      end,
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      {
        "<leader>gg",
        function()
          Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
        end,
        desc = "Lazygit (root dir)",
      },
      {
        "<leader>gG",
        function()
          Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
        end,
        desc = "Lazygit (cwd)",
      },
    },
  },
}
