-- Display :options
local options = {
  -- 2 movin around, searching and patterns
  incsearch = true,
  ignorecase = true,
  smartcase = true,

  -- 4 displaying text
  scrolloff = 5,
  wrap = false,
  sidescrolloff = 5,
  fillchars = {
    eob = " ",
    fold = " ",
    foldopen = "",
    foldsep = " ",
    foldclose = "",
  },
  cmdheight = 1,
  list = true,
  listchars = {
    eol = "↲",
    tab = "∙∙",
    space = " ",
    multispace = " ",
    lead = " ",
    leadmultispace = " ",
    trail = "∙",
  },
  number = true,
  relativenumber = true,
  numberwidth = 2,
  conceallevel = 0,

  -- 5 syntax, highlighting and spelling
  background = "dark",
  hlsearch = false,
  termguicolors = true,
  cursorcolumn = false,
  cursorline = true,

  -- 6 multiple windows
  laststatus = 3,
  winminwidth = 5,
  splitbelow = true,
  splitright = true,

  -- 7 multiple tab pages
  showtabline = 0,

  -- 8 terminal
  title = true,
  icon = true,

  -- 9 using the mouse
  mouse = "a",

  -- 10 messages and info
  showcmd = true,
  showmode = false,
  ruler = false,
  confirm = true,

  -- 11 selection text
  clipboard = "unnamedplus",

  -- 12 editing text
  undolevels = 10000,
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
  foldlevel = 99,
  foldlevelstart = 99,
  foldcolumn = '1',
  foldmethod = "manual",

  -- 16 mapping
  timeoutlen = 300,

  -- 17 reading and writing files
  writebackup = true,
  backup = false,
  autoread = true,

  -- 18 the swap file
  swapfile = false,
  updatetime = 200,

  -- 23 multi-byte characters
  encoding = "utf-8",
  fileencoding = "utf-8",
  emoji = true,

  -- 24 various
  virtualedit = "block",
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
  signcolumn = "yes",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.skip_ts_context_commentstring_module = true

if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
end

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.require'util'.ui.foldtext()"

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.statuscolumn = [[%!v:lua.require'util'.ui.statuscolumn()]]
end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
-- if vim.fn.has("nvim-0.10") == 1 then
--   vim.opt.foldmethod = "expr"
--   vim.opt.foldexpr = "v:lua.require'util'.ui.foldexpr()"
-- else
--   vim.opt.foldmethod = "indent"
-- end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
