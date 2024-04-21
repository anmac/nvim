return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
    filetypes_denylist = {
      "alpha",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dap-repl",
      "dap-terminal",
      "dapui_console",
      "dashboard",
      "dirbuf",
      "dirvish",
      "DressingInput",
      "fugitive",
      "harpoon",
      "help",
      "lazy",
      "lspinfo",
      "Man",
      "man",
      "mason",
      "Markdown",
      "NvimTree",
      "neo-tree",
      "neo-tree-popup",
      "notify",
      "packer",
      "spectre_panel",
      "startify",
      "toggleterm",
      "trouble",
      "TelescopePrompt",
      "TelescopeResult",
    },
    modes_allowlist = { "n", "i" },
    under_cursor = true,
    min_count_to_highlight = 1,
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](false)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("]]", "next", buffer)
        map("[[", "prev", buffer)
      end,
    })
  end,
}
