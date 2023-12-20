return {
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "UndoTree" }
    }
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gf", vim.cmd.Git, desc = "Git Status" }
    }
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
        keymap({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        keymap({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        keymap("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
        keymap("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        keymap("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
        keymap("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
        keymap("n", "<leader>gb", function() gs.blame_line() end, "Blame Line")
        keymap("n", "<leader>gB", function() gs.blame_line({ full = true }) end, "Blame Line Full")
        keymap("n", "<leader>gd", gs.diffthis, "Diff This")
        keymap("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
        keymap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        vim.cmd([[highlight GitSignsCurrentLineBlame guifg=#6d707c]])
      end,
    },
  },
}
