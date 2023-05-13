local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("notify plugin failed!")
  return
end

notify.setup({
  background_colour = "Normal",
  fps = 5,
  level = 2,
  max_width = 60,
  max_height = 20,
  minimum_width = 30,
  render = "default",
  stages = "static",
  timeout = 5000,
  top_down = true,
})
