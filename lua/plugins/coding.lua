return {

  -- auto completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-cmdline" },
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#9cdcfe", bg = "NONE" })
      vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
      vim.api.nvim_set_hl(0, "CmpItemMenu", { link = "@comment" })

      local cmp = require("cmp")

      opts.enabled = function()
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype == "prompt" then
          return false
        end
        -- Keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          local context = require("cmp.config.context")
          -- Disable completion in comments
          return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
        end
      end

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      })

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
          local icons = require("plugins.core")[1].opts.icons.kinds
          local label = item.kind
          -- Kind icon
          item.kind = icons[item.kind] or ""
          -- Abbr
          local function trim(text)
            local maxLenght = 32
            if text and text:len() > maxLenght then
              text = text:sub(1, maxLenght) .. "…"
            end
            return text
          end
          item.abbr = trim(item.abbr)
          -- Menu
          item.menu = label
          return item
        end,
      }

      opts.experimental = nil
      opts.view = { entries = { name = "custom", selection_order = "near_cursor" } }
      opts.window = { documentation = cmp.config.window.bordered() }

      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "nvim-cmp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
          local luasnip = require("luasnip")
          local cmp = require("cmp")

          opts.mapping = vim.tbl_extend("force", opts.mapping, {
            ["<Tab>"] = cmp.mapping(function(fallback)
              if luasnip.locally_jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          })
        end,
      },
    },
    keys = function()
      return {}
    end,
  },
}
