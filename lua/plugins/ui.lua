return {

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<S-h>", false },
      { "<S-l>", false },
    },
    opts = {
      options = {
        right_mouse_command = "vertical sbuffer %d",
        middle_mouse_command = function(n)
          require("mini.bufremove").delete(n, false)
        end,
        indicator = { icon = "┃", style = "icon" },
        offsets = {
          {
            filetype = "neo-tree",
            text = "󰥩 Explorer",
            highlight = "Directory",
          },
        },
        separator_style = "thin",
      },
    },
  },
}
