return {
  {
    "ThePrimeagen/harpoon",
    keys = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")
      return {
        { "<leader>m", mark.add_file, desc = "Mark File" },
        { "<leader><Tab>", ui.toggle_quick_menu, desc = "Marked File Navigation" },
       -- { "<C-i>", function() ui.nav_file(1) end, desc = "Go 1" },
       -- { "<C-o>", function() ui.nav_file(2) end, desc = "Go 2" },
       -- { "<C-n>", function() ui.nav_file(1) end, desc = "Go 1" },
       -- { "<C-m>", function() ui.nav_file(2) end, desc = "Go 2" },
        { "<Tab>", ui.nav_next, desc = "Next Marked File" },
        { "<S-Tab>", ui.nav_prev, desc = "Previous Marked File" },
      }
    end,
  },
}
