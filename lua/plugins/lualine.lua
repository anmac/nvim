local Util = require("util")

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = require("config.icons")

    vim.o.laststatus = vim.g.lualine_laststatus
    vim.api.nvim_set_hl(0, "Tabnine", { fg = "#cb43f0" })

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

    local tabnine = {
      "tabnine",
      fmt = function(str)
        local parts = vim.split(str, " ")
        if vim.o.columns > 100 then
          return "%#Tabnine#" .. parts[1] .. " %* " .. parts[2] .. " " .. parts[3]
        else
          return "%#Tabnine#" .. parts[1]
        end
      end,
      cond = function()
        local enough_space = hide_in_col(85)()
        return Util.has("tabnine-nvim") and enough_space
      end
    }

    local location = {
      "location",
      fmt = function(str)
        local line, col = string.match(str, "(%d+):(%d+)")
        return string.format("Ln %s,Col %s", line, col)
      end,
      color = { fg = "#fff" },
      cond = hide_in_col(100),
    }

    local spaces = {
      function()
        return "Spaces:" .. vim.api.nvim_buf_get_option(0, "shiftwidth")
      end,
      color = { fg = "#fff" },
      cond = hide_in_col(80),
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
      cond = hide_in_col(50),
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

    return {
      options = {
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { branch },
        lualine_c = {
          Util.lualine.root_dir(),
          {
            "diagnostics",
            sections = { "error", "warn", "hint" },
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              hint = icons.diagnostics.Hint,
            },
            always_visible = true,
          },
          {
            "diff",
            diff_color = {
              added = "DiagnosticInfo",
              modified = "DiagnosticWarn",
              removed = "DiagnosticError",
            },
            symbols = {
              added = icons.git.Added,
              modified = icons.git.Modified,
              removed = icons.git.Removed,
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
          Util.lualine.pretty_path(),
        },
        lualine_x = {
          tabnine,
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = Util.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = Util.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = Util.ui.fg("Special"),
          },
          location,
          spaces,
          eol,
          encoding,
          filetype,
        },
        lualine_y = {},
        lualine_z = { "progress" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "fugitive", "lazy", "man", "nvim-dap-ui" },
    }
  end,
}
