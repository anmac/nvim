-- Shorten function name
local keymap = vim.keymap.set

local opts = function(description)
  description = description or nil
  return { noremap = true, silent = true, desc = description }
end

------------------------------
----------- MODES ------------
------------------------------
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Disable default global keymaps
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

-- Write/Save and Quit
keymap("n", "<leader>w", "<cmd>w<cr>", opts("Save"))
keymap("n", "<leader>q", "<cmd>q<cr>", opts("Quit"))
keymap("n", "<leader>Q", "<cmd>qa<cr>", opts("Quit All"))

-- Move around in Insert Mode with hjkl
keymap("i", "<C-h>", "<Left>", opts())
keymap("i", "<C-j>", "<Down>", opts())
keymap("i", "<C-k>", "<Up>", opts())
keymap("i", "<C-l>", "<Right>", opts())

-- Stay cursor in place
keymap("n", "J", "mzJ`z", opts())

-- Select All
keymap("n", "<leader><C-a>", "ggVG", opts("Select All"))

-- Diagnostic
keymap("n", "gl", function()
  vim.diagnostic.open_float({ scope = "line" })
end, opts("Line Diagnostic"))
