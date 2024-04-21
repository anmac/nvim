return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  enabled = false,
  opts = function()
    local bufferline = require("bufferline")

    return {
      options = {
        style_preset = bufferline.style_preset.no_bold,
        themable = true,
        right_mouse_command = "vertical sbuffer %d",
        indicator = {
          icon = "┃",
          style = "icon",
        },
        buffer_close_icon = "󰅖",
        close_icon = "",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count)
          return "" .. count .. ""
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = " Neo-tree",
            highlight = "Directory",
            text_align = "center",
            separator = true,
          },
        },
        persist_buffer_sort = true,
        separator_style = "thin",
        always_show_bufferline = false,
      }
    }
  end,
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd("BufAdd", {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
