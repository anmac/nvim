-- Shorten function name
local keymap = vim.keymap.set

local opts = function(description)
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
vim.keymap.del("n", "j")
vim.keymap.del("x", "j")
vim.keymap.del("n", "k")
vim.keymap.del("x", "k")
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<c-_>")
vim.keymap.del("t", "<c-/>")
vim.keymap.del("t", "<c-_>")
-- vim.keymap.del("n", "<leader>ww")
-- vim.keymap.del("n", "<leader>wd")
-- vim.keymap.del("n", "<leader>w-")
-- vim.keymap.del("n", "<leader>w|")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
-- vim.keymap.del("n", "<leader>wm")
-- vim.keymap.del("n", "<leader><tab>l")
-- vim.keymap.del("n", "<leader><tab>f")
-- vim.keymap.del("n", "<leader><tab><tab>")
-- vim.keymap.del("n", "<leader><tab>]")
-- vim.keymap.del("n", "<leader><tab>d")
-- vim.keymap.del("n", "<leader><tab>[")

-- Write/Save and Quit
keymap("n", "<leader>w", "<cmd>w<cr>", opts("Save"))
keymap("n", "<leader>q", "<cmd>q<cr>", opts("Quit"))
keymap("n", "<leader>Q", "<cmd>qa<cr>", opts("Quit All"))

-- Move around in Insert Mode with hjkl
keymap("i", "<C-h>", "<Left>", opts())
keymap("i", "<C-j>", "<Down>", opts())
keymap("i", "<C-k>", "<Up>", opts())
keymap("i", "<C-l>", "<Right>", opts())

-- Buffers
keymap("n", "<A-Left>", "<cmd>bprevious<cr>", opts("Prev Buffer"))
keymap("n", "<A-Right>", "<cmd>bnext<cr>", opts("Next Buffer"))

-- Stay cursor in place
keymap("n", "J", "mzJ`z", opts())

-- Better clipboard integration
keymap("x", "p", '"_dP', opts("Paste with no copy"))
keymap("x", "<leader>p", '"+dP', opts("Paste and copy to clipboard"))

-- Select All
keymap("n", "<leader><C-a>", "ggVG", opts("Select All"))

-- jq tool
keymap("n", "<leader>cj", "<cmd>%!jq<cr>", opts("Format JSON"))
keymap("n", "<leader>cJ", "<cmd>%!jq --compact-output<cr>", opts("Compact JSON"))
keymap("v", "<leader>cj", ":'<,'>!jq<cr>", opts("Format JSON"))
keymap("v", "<leader>cJ", ":'<,'>!jq --compact-output<cr>", opts("Compact JSON"))

-- Diagnostic
keymap("n", "gl", function()
  vim.diagnostic.open_float({ scope = "line" })
end, opts("Line Diagnostic"))

-- Searching
keymap("n", "<leader>fG", ":copen | :silent :grep ", opts("Ripgrep (include git-files)"))

-- Increment/Decrement
keymap("n", "+", "<C-a>", opts())
keymap("n", "-", "<C-x>", opts())

-- New tab
keymap("n", "te", "<cmd>tabedit<cr>", opts())
keymap("n", "<tab>", "<cmd>tabnext<cr>", opts())
keymap("n", "<S-tab>", "<cmd>tabprev<cr>", opts())

-- floating terminal
-- local lazyterm = function()
--   LazyVim.terminal(nil, { cwd = LazyVim.root() })
-- end
-- keymap("n", "<c-\\>", lazyterm, opts("Terminal (Root Dir)"))
-- keymap("n", "<c-_>", lazyterm, opts("which_key_ignore"))

-- Terminal Mappings
-- keymap("t", "<c-\\>", "<cmd>close<cr>", opts("Hide Terminal"))
-- keymap("t", "<c-_>", "<cmd>close<cr>", opts("which_key_ignore"))

-- Windows
-- keymap("n", "<leader>m", function()
--   LazyVim.toggle.maximize()
-- end, { desc = "Maximize Toggle" })
