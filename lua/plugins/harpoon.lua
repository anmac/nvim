return {
  {
    "ThePrimeagen/harpoon",
    keys = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      return {
        { "<leader>m", mark.add_file, desc = "Mark File" },
        { "<leader><Tab>", ui.toggle_quick_menu, desc = "Marked File Navigation" },
        { "<leader>h", function() ui.nav_file(1) end, desc = "Go 1" },
        { "<leader>t", function() ui.nav_file(2) end, desc = "Go 2" },
        { "<leader>n", function() ui.nav_file(3) end, desc = "Go 3" },
        { "<leader>s", function() ui.nav_file(4) end, desc = "Go 4" },
        { "<Tab>", ui.nav_next, desc = "Next Marked File" },
        { "<S-Tab>", ui.nav_prev, desc = "Previous Marked File" },
      }
    end,
  },
}
