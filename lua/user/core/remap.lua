-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }
local function dopts(description)
  return { noremap = true, silent = true, desc = description }
end

-- Functions
local f = require("user.resources.functions")

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

------------------------------
----------- MODES ------------
------------------------------
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Write/Save, Quit and Quit without save
keymap("n", "<leader>w", ":w<CR>", dopts("Save"))
keymap("n", "<leader>q", function() f.smart_quit() end, dopts("Quit"))
keymap("n", "<leader>Q", ":q!<CR>", dopts("Quit no save"))

-- Move around in Insert Mode with hjkl
keymap("i", "<C-h>", "<Left>", opts)
keymap("i", "<C-j>", "<Down>", opts)
keymap("i", "<C-k>", "<Up>", opts)
keymap("i", "<C-l>", "<Right>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with hjkl
keymap("n", "<M-j>", ":resize -2<CR>", opts)
keymap("n", "<M-k>", ":resize +2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Resize with arrows
keymap("n", "<M-Up>", ":resize -2<CR>", opts)
keymap("n", "<M-Down>", ":resize +2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-- Navigate and delete buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("n", "<leader>j", ":move .+1<CR>==", dopts("Move text"))
keymap("n", "<leader>k", ":move .-2<CR>==", dopts("Move text"))

-- Stay in "Indent Mode"
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)

-- Stay cursor in place
keymap("n", "J", "mzJ`z", opts)

-- Better search view
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Greatest remaps ever
keymap("x", "<leader>p", "\"_dhp", dopts("Paste text"))
keymap({ "n", "x" }, "<leader>d", "\"_d", dopts("Delete text"))

-- Select all
keymap("n", "<C-a>", "ggVG", opts)

-- Trim whitespaces
keymap("n", "<C-M-l>", function() f.trim_trailing_whitespace() end, dopts("Trim whitespaces"))

-- Nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", dopts("File Explorer"))

