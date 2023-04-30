local options = {
  -- 2 movin around, searching and patterns
  incsearch = true,
  ignorecase = true,
  smartcase = true,

  -- 4 displaying text
  scrolloff = 5,
  wrap = false,
  sidescrolloff = 5,
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  cmdheight = 1,
  list = true,
  -- listchars = [[eol:↲,tab:··,lead:·,leadmultispace:∙,space: ,multispace: ,trail: ]],
  listchars = [[eol:↲,tab:  ,lead: ,leadmultispace: ,space: ,multispace: ,trail: ]],
  number = true,
  relativenumber = true,
  numberwidth = 5,
  conceallevel = 0,

  -- 5 syntax, highlighting and spelling
  background = "dark",
  hlsearch = true,
  termguicolors = true,
  cursorcolumn = false,
  cursorline = true,

  -- 6 multiple windows
  laststatus = 3,
  splitbelow = true,
  splitright = true,

  -- 7 multiple tab pages
  showtabline = 2,

  -- 8 terminal
  title = true,
  icon = true,

  -- 9 using the mouse
  mouse = "a",

  -- 10 messages and info
  showcmd = true,
  showmode = false,
  ruler = false,

  -- 11 selection text
  clipboard = "unnamedplus",

  -- 12 editing text
  undofile = true,
  completeopt = { "menuone", "preview", "noselect" },
  pumheight = 12,

  -- 13 tabs and indenting
  tabstop = 2,
  shiftwidth = 2,
  smarttab = true,
  expandtab = true,
  autoindent = true,
  smartindent = true,

  -- 14 folding
  foldenable = true,
  foldmethod = "manual",

  -- 16 mapping
  timeoutlen = 100,

  -- 17 reading and writing files
  writebackup = true,
  backup = false,
  autoread = true,

  -- 18 the swap file
  swapfile = false,
  updatetime = 300,

  -- 23 multi-byte characters
  encoding = "utf-8",
  fileencoding = "utf-8",
  emoji = true,

  -- 24 various
  signcolumn = "yes",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
-- vim.opt.formatoptions:remove("cro")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
