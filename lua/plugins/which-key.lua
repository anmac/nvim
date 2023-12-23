return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    window = { border = "rounded" },
    layout = { align = "center" },
    defaults = {
      ["g"] = { name = "+GoTo" },
      ["]"] = { name = "+Next" },
      ["["] = { name = "+Prev" },
      ["<leader><tab>"] = { name = "+Tabs" },
      ["<leader>b"] = { name = "+Buffer" },
      ["<leader>c"] = { name = "+Code" },
      ["<leader>f"] = { name = "+File/Find" },
      ["<leader>g"] = { name = "+Git" },
      ["<leader>gh"] = { name = "+Hunks" },
      ["<leader>s"] = { name = "+Search" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}
