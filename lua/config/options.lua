local options = {
  -- 2 movin around, searching and patterns
  inccommand = "nosplit",
  incsearch = true,
  ignorecase = true,
  smartcase = true,

  -- 4 displaying text
  scrolloff = 5,
  sidescrolloff = 8,
  fillchars = {
    fold = " ",
    foldopen = "",
    foldclose = "",
    foldsep = " ",
    diff = "╱",
    eob = " ",
  },
  cmdheight = 1,
  list = true,
  listchars = {
    eol = "↲",
    tab = "» ",
    space = " ",
    multispace = " ",
    lead = " ",
    leadmultispace = " ",
    trail = "·",
  },
  conceallevel = 0,

  -- 7 multiple tab pages
  showtabline = 2,

  -- 8 terminal
  icon = true,

  -- 12 editing text
  completeopt = { "menuone", "preview", "noselect" },
  pumblend = 0,
  pumheight = 12,

  -- 14 folding
  foldenable = true,
  foldlevel = 99,
  foldlevelstart = 99,
  foldcolumn = "1",
  -- foldmethod = "manual",

  -- 18 the swap file
  swapfile = false,

  -- 24 various
  sessionoptions = {
    "buffers",
    "curdir",
    "folds",
    "globals",
    "help",
    "localoptions",
    "skiprtp",
    "tabpages",
    "terminal",
    "winpos",
    "winsize",
  },
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.g.autoformat = false
