local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("mason plugin failed!")
  return
end

mason.setup({
  ui = {
    border = "rounded",
    width = 0.6,
    height = 0.8,
  },
})
