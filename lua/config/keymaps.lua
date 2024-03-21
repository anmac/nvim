-- Shorten function name
local keymap = vim.keymap.set

local dopts = function(description)
  description = description or nil
  return { noremap = true, silent = true, desc = description }
end

local function trim_trailing_whitespace()
  local current_position = vim.fn.getpos(".")
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.setpos(".", current_position)
end

local function smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_buf_get_option(bufnr, "modified")
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd("q!")
      end
    end)
  else
    vim.cmd("q!")
  end
end

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

-- Clear on pressing <Esc> in normal mode
keymap({ "i", "n" }, "<Esc>", "<cmd>nohlsearch<cr><esc>", dopts("Escape and clear hlsearch"))
-- Write/Save, Quit and Quit without save
keymap("n", "<leader>w", "<cmd>w<cr>", dopts("Save"))
keymap("n", "<leader>q", function()
  smart_quit()
end, dopts("Quit"))
keymap("n", "<leader>Q", "<cmd>qa<cr>", dopts("Quit all"))
keymap({ "i", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Move around in Insert Mode with hjkl
keymap("i", "<C-h>", "<Left>", dopts())
keymap("i", "<C-j>", "<Down>", dopts())
keymap("i", "<C-k>", "<Up>", dopts())
keymap("i", "<C-l>", "<Right>", dopts())

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", dopts())
keymap("n", "<C-j>", "<C-w>j", dopts())
keymap("n", "<C-k>", "<C-w>k", dopts())
keymap("n", "<C-l>", "<C-w>l", dopts())

-- Resize with <Alt> hjkl
keymap("n", "<M-j>", "<cmd>resize -2<cr>", dopts())
keymap("n", "<M-k>", "<cmd>resize +2<cr>", dopts())
keymap("n", "<M-h>", "<cmd>vertical resize -2<cr>", dopts())
keymap("n", "<M-l>", "<cmd>vertical resize +2<cr>", dopts())

-- Resize with <Alt> arrows
keymap("n", "<M-Up>", "<cmd>resize -2<cr>", dopts())
keymap("n", "<M-Down>", "<cmd>resize +2<cr>", dopts())
keymap("n", "<M-Left>", "<cmd>vertical resize -2<cr>", dopts())
keymap("n", "<M-Right>", "<cmd>vertical resize +2<cr>", dopts())

-- Navigate and delete buffers
-- keymap("n", "<Tab>", ":bnext<cr>", dopts())
-- keymap("n", "<S-Tab>", ":bprevious<cr>", dopts())

-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv=gv", dopts())
keymap("x", "K", ":move '<-2<cr>gv=gv", dopts())
keymap("n", "<leader>j", ":move .+1<cr>==", dopts("Move text "))
keymap("n", "<leader>k", ":move .-2<cr>==", dopts("Move text "))

-- Stay in "Indent Mode"
keymap("x", "<", "<gv", dopts())
keymap("x", ">", ">gv", dopts())

-- Stay cursor in place
keymap("n", "J", "mzJ`z", dopts())

-- Better search view
keymap("n", "n", "nzzzv", dopts())
keymap("n", "N", "Nzzzv", dopts())

-- Add undo break-points
keymap("i", ",", ",<C-g>u")
keymap("i", ".", ".<C-g>u")
keymap("i", ";", ";<C-g>u")

-- Greatest remaps ever
keymap("x", "<leader>p", '"_dP', dopts("Paste text"))
keymap({ "n", "x" }, "d", '"_d', dopts("Delete without copy"))
keymap({ "n", "x" }, "<leader>d", '"+d', dopts("Delete and copy to clipboard"))
keymap("n", "D", '"_D', dopts("Delete line without copy"))
keymap("n", "<leader>D", '"+D', dopts("Delete line and copy to clipboard"))

-- Select all
keymap("n", "<C-a>", "ggVG", dopts("Select all"))

-- Replace in visual mode
keymap("v", "<leader>r", '"hy:%s/<C-r>h//g<Left><Left>', dopts("Replace Highlighted"))

-- Trim whitespaces
keymap("n", "<C-M-l>", function()
  trim_trailing_whitespace()
end, dopts("Trim whitespaces"))

-- Lazy
keymap("n", "<leader>l", "<cmd>Lazy<cr>", dopts("Lazy"))
