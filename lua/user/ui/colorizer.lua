local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  vim.notify("colorizer loading failed!")
  return
end

colorizer.setup({
  filetypes = { "*" },
  user_default_options = {
    RGB = true,
    RRGGBB = true,
    names = true,
    RRGGBBAA = true,
    AARRGGBB = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
    mode = "background",
    tailwind = true,
    sass = { enable = true, parsers = { css } },
    virtualtext = "■",
  },
})
