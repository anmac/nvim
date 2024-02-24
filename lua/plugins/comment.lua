return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  keys = function()
    local api = require("Comment.api")
    local esc = vim.api.nvim_replace_termcodes(
      "<ESC>", true, false, true
    )
    return {
      { "<leader>/", api.toggle.linewise.current, mode = "n", desc = "Comment Line" },
      { "<leader><C-_>", api.toggle.blockwise.current, mode = "n", desc = "Comment Block" },
      { "<leader>/",
        function()
          vim.api.nvim_feedkeys(esc, "nx", false)
          api.toggle.linewise(vim.fn.visualmode())
        end,
        mode = "x",
        desc = "comment line"
      },
      { "<leader><C-_>",
        function()
          vim.api.nvim_feedkeys(esc, "nx", false)
          api.toggle.blockwise(vim.fn.visualmode())
        end,
        mode = "x",
        desc = "Comment Block"
      },
    }
  end,
  opts = {
    padding = true,
    sticky = true,
    ignore = "^$",
    toggler = {
      line = "gcc",
      block = "gbc",
    },
    opleader = {
      line = "gc",
      block = "gb",
    },
    extra = {
      above = "gcO",
      below = "gco",
      eol = "gcA",
    },
    mappings = {
      basic = true,
      extra = true,
    },
  },
  config = function(_, opts)
    opts["pre_hook"] = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() or vim.bo.commentstring
    require("Comment").setup(opts)
  end
}
