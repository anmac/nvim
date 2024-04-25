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

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      }

      for key, value in pairs(options) do
        opts["options"][key] = value
      end

      local function hide_in_col(col)
        return function()
          return vim.o.columns > col
        end
      end

      local branch = {
        "branch",
        icon = { "", color = { fg = "#d16969", bg = "" } },
        color = { fg = "#dfafdf", bg = "" },
      }
      local location = {
        "location",
        fmt = function(str)
          local line, col = string.match(str, "(%d+):(%d+)")
          return string.format("Ln %s,Col %s", line, col)
        end,
        color = { fg = "#fff" },
        cond = hide_in_col(120),
      }

      local spaces = {
        function()
          return "Spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
        end,
        color = { fg = "#fff" },
        cond = hide_in_col(50),
      }

      local eol = {
        function()
          local format = vim.bo.fileformat
          if format == "unix" or format == "mac" then
            return "LF"
          elseif format == "dos" then
            return "CRLF"
          else
            return "Unknown"
          end
        end,
        color = { fg = "#fff" },
        cond = hide_in_col(80),
      }

      local encoding = {
        "encoding",
        fmt = string.upper,
        color = { fg = "#fff" },
        cond = hide_in_col(80),
      }

      local filetype = {
        "filetype",
        fmt = function(str)
          if vim.bo.filetype == "neo-tree" then
            return "🌳"
          end
          return str
        end,
        color = { fg = "#fff" },
      }

      local icons = require("plugins.core")[1].opts.icons
      local sections = {
        lualine_b = { branch },
        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            sections = { "error", "warn", "hint" },
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            "diff",
            diff_color = {
              added = "DiagnosticInfo",
              modified = "DiagnosticWarn",
              removed = "DiagnosticError",
            },
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
            cond = hide_in_col(50),
          },
          { LazyVim.lualine.pretty_path() },
        },
      }

      for key, value in pairs(sections) do
        opts["sections"][key] = value
      end

      local function deleteElement(_table, value)
        for i, element in ipairs(_table) do
          if type(element) == "table" and element[1] == value then
            table.remove(_table, i)
          end
        end
      end

      deleteElement(opts["sections"].lualine_x, "diff")
      table.insert(opts["sections"].lualine_x, location)
      table.insert(opts["sections"].lualine_x, spaces)
      table.insert(opts["sections"].lualine_x, eol)
      table.insert(opts["sections"].lualine_x, encoding)
      table.insert(opts["sections"].lualine_x, filetype)

      opts["sections"].lualine_y = {}
      opts["sections"].lualine_z = { "progress" }
      opts["extensions"] = { "fugitive", "lazy", "man", "nvim-dap-ui" }

      return opts
    end,
  },

  -- indent guides for neovim
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = { enabled = true, show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "Markdown",
          "NvimTree",
          "TelescopePrompt",
          "TelescopeResult",
          "Trouble",
          "alpha",
          "checkhealth",
          "dashboard",
          "fugitive",
          "gitcommit",
          "help",
          "lazy",
          "lazyterm",
          "lspinfo",
          "man",
          "markdown",
          "mason",
          "neo-tree",
          "neogitstatus",
          "notify",
          "packer",
          "startify",
          "toggleterm",
          "trouble",
        },
        buftypes = { "terminal", "nofile", "quickfix", "prompt", "nvimtree" },
      },
    },
  },
}
