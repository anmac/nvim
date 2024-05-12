local user = os.getenv("USER") .. "_"

local function augroup(name)
  return vim.api.nvim_create_augroup(user .. name, { clear = true })
end

-- Save Window View Position
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  group = augroup("window_leave"),
  callback = function()
    vim.api.nvim_exec("let b:winview = winsaveview()", false)
  end,
})

-- Restore Window View Position
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = augroup("window_enter"),
  callback = function()
    if vim.api.nvim_eval("exists('b:winview')") == 1 then
      vim.api.nvim_exec("call winrestview(b:winview)", false)
    end
  end,
})

-- Enable autoformat for lua files
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("formatting"),
  pattern = { "lua" },
  callback = function()
    vim.g.autoformat = true
  end,
})
