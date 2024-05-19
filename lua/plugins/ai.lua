return {

  -- Free, ultrafast Copilot alternative
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.g.codeium_filetypes = {
        ["DressingInput"] = false,
        ["fugitive"] = false,
        ["toggleterm"] = false,
        ["TelescopePrompt"] = false,
        ["neo-tree-popup"] = false,
        ["nofile"] = false,
      }
      vim.api.nvim_set_hl(0, "Codeium", { fg = "#6fe8d7" })
    end,
  },
}
