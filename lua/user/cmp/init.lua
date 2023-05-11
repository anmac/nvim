local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("cmp plugin failed!")
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  vim.notify("luasnip plugin failed!")
  return
end

require("luasnip.loaders.from_vscode").lazy_load()
local icons = require("user.resources.kind_icons")

cmp.setup({
  enabled = function()
    local buftype = vim.api.nvim_buf_get_option(0, "buftype")
    local context = require("cmp.config.context")
    if buftype == "prompt" then
      return false
    elseif vim.api.nvim_get_mode().mode == 'c' then
      return true
    elseif context.in_treesitter_capture("comment") or context.in_syntax_group("Comment") then
      return false
    end
    return true
  end,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
    ["<Right>"] = cmp.mapping.confirm({ select = true }),
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
  }),
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer", keyword_length = 2 },
    { name = "path" },
  }, { { name = "buffer" } }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      local label = vim_item.kind or ""
      vim_item.kind = icons[vim_item.kind] or ""
      -- Abbr
      local trim = function(text)
        local max = 36
        if text and text:len() > max then
          text = text:sub(1, max) .. "..."
        end
        return text
      end
      vim_item.abbr = trim(vim_item.abbr)
      -- Menu: Label and Source
      vim_item.menu = label .. " " .. ({
        luasnip = "[LuaSnip]",
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
        cmdline = "[Cmdline]",
      })[entry.source.name]
      return vim_item
    end
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" }
        },
      },
    })
})
