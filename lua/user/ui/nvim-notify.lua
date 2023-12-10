M = {
  background_colour = "Normal",
  fps = 5,
  level = 2,
  minimum_width = 30,
  max_width = function()
    return math.floor(vim.o.columns * 0.75)
  end,
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
  render = "compact",
  stages = "static",
  timeout = 5000,
  top_down = true,
}

return M
