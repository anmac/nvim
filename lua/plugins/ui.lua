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
      table.insert(opts["sections"].lualine_x, {
        function()
          return require("noice").api.status.search.get()
        end,
        cond = function()
          return package.loaded["noice"] and require("noice").api.status.search.has()
        end,
        color = { fg = "#ff9e64" },
      })
      table.insert(opts["sections"].lualine_x, location)
      table.insert(opts["sections"].lualine_x, spaces)
      table.insert(opts["sections"].lualine_x, eol)
      table.insert(opts["sections"].lualine_x, encoding)
      table.insert(opts["sections"].lualine_x, filetype)

      opts["sections"].lualine_y = {}
      opts["sections"].lualine_z = { "progress" }
      opts["extensions"] = { "fugitive", "lazy", "man", "nvim-dap-ui" }
    end,
  },

  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.messages = { view_search = false }
      opts.lsp.progress = { enabled = false }
      opts.lsp.hover = { enabled = true, silent = true, opts = { border = "rounded" } }
      opts.lsp.signature = { enabled = true, opts = { border = "rounded" } }
      opts.presets.lsp_doc_border = true
    end,
  },

  -- the fastest neovim colorizer
  {
    "catgoose/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "*",
        "!lazy",
        "!neo-tree",
        css = { names = true },
        scss = { names = true },
      },
      user_default_options = {
        names = false,
        css = true,
        css_fn = true,
        tailwind = true,
        sass = { enable = true, parsers = { "css" } },
      },
    },
  },

  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {
      file = {
        [".gitignore"] = { glyph = "󰊢", hl = "MiniIconsRed" },
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
            win = {
              list = {
                keys = {
                  ["<ESC>"] = "",
                  ["w"] = "confirm",
                  ["l"] = "",
                  ["h"] = "",
                  ["C"] = "explorer_close",
                },
              },
            },
          },
        },
        icons = {
          git = {
            staged = "●",
            added = "A",
            deleted = "D",
            ignored = "?",
            modified = "M",
            renamed = "R",
            untracked = "U",
          },
        },
      },
      indent = {
        indent = {
          enabled = false,
          char = "▏",
          only_scope = true,
          only_current = true,
          hl = {
            "RainbowDelimiterRed",
            "RainbowDelimiterBlue",
            "RainbowDelimiterCyan",
            "RainbowDelimiterGreen",
            "RainbowDelimiterOrange",
            "RainbowDelimiterViolet",
            "RainbowDelimiterYellow",
          },
        },
        scope = { enabled = false },
      },
    },
  },
}
