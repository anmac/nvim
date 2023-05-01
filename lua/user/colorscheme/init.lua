local colorscheme = "tokyonight"

local config_theme, _ = pcall(require, "user.colorscheme." .. colorscheme)
if not config_theme then
  vim.notify(colorscheme .. ": config file not found!")
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify(colorscheme .. " colorscheme not found!")
  vim.cmd([[colorscheme habamax]])
  vim.notify("loading default colorscheme...")
  return
end

