local highlight = {
  "rainbowcol1",
  "rainbowcol2",
  "rainbowcol3",
  "rainbowcol4",
  "rainbowcol5",
  "rainbowcol6",
  "rainbowcol7",
}

M = {
  debounce = 100,
  indent = { char = "▏" },
  whitespace = { highlight = { "NonText" }, remove_blankline_trail = false },
  scope = { show_start = false, show_end = false, highlight = highlight },
  exclude = {
    filetypes = {
      "checkhealth",
      "dashboard",
      "fugitive",
      "gitcommit",
      "help",
      "man",
      "lazy",
      "lspinfo",
      "markdown",
      "Markdown",
      "neogitstatus",
      "NvimTree",
      "packer",
      "startify",
      "toggleterm",
      "TelescopePrompt",
      "TelescopeResult",
      "Trouble",
      "",
    },
    buftypes = { "terminal", "nofile", "quickfix", "prompt", "nvimtree" },
  },
}

return M
