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
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>qq")

-- Write/Save and Quit
keymap("n", "<leader>w", "<cmd>w<cr>", opts("Save"))
keymap("n", "<leader>q", "<cmd>q<cr>", opts("Quit"))
keymap("n", "<leader>Q", "<cmd>qa<cr>", opts("Quit All"))
