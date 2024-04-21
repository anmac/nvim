local Util = require("util")

local M = {}

---@param opts ConformOpts
function M.setup(_, opts)
  for name, formatter in pairs(opts.formatters or {}) do
    if type(formatter) == "table" then
      ---@diagnostic disable-next-line: undefined-field
      if formatter.extra_args then
        ---@diagnostic disable-next-line: undefined-field
        formatter.prepend_args = formatter.extra_args
        Util.deprecate(("opts.formatters.%s.extra_args"):format(name), ("opts.formatters.%s.prepend_args"):format(name))
      end
    end
  end

  for _, key in ipairs({ "format_on_save", "format_after_save" }) do
    if opts[key] then
      require("lazy.core.util").warn(
        ("Don't set `opts.%s` for `conform.nvim`.\n**LazyVim** will use the conform formatter automatically"):format(
          key
        )
      )
      ---@diagnostic disable-next-line: no-unknown
      opts[key] = nil
    end
  end
  require("conform").setup(opts)
end

return {
  "stevearc/conform.nvim",
  dependencies = { "mason.nvim" },
  lazy = true,
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cF",
      function()
        require("conform").format({ formatters = { "injected" } })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
    {
      "<leader>cc",
      function()
        require("conform").format({
          async = true,
          lsp_fallback = true,
        })
      end,
      desc = "Format File (Conform)",
    },
  },
  init = function()
    Util.on_very_lazy(function()
      Util.format.register({
        name = "conform.nvim",
        priority = 100,
        primary = true,
        format = function(buf)
          local plugin = require("lazy.core.config").plugins["conform.nvim"]
          local Plugin = require("lazy.core.plugin")
          local opts = Plugin.values(plugin, "opts", false)
          require("conform").format(Util.merge(opts.format, { bufnr = buf }))
        end,
        sources = function(buf)
          local ret = require("conform").list_formatters(buf)
          return vim.tbl_map(function(v)
            return v.name
          end, ret)
        end,
      })
    end)
  end,
  opts = function()
    local util = require("conform.util")
    -- local plugin = require("lazy.core.config").plugins["conform.nvim"]
    -- if plugin.config ~= M.setup then
    --   Util.error({
    --     "Don't set `plugin.config` for `conform.nvim`.\n",
    --     "This will break **LazyVim** formatting.\n",
    --     "Please refer to the docs at https://www.lazyvim.org/plugins/formatting",
    --   }, { title = "LazyVim" })
    -- end
    ---@class ConformOpts
    local opts = {
      format = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
      },
      formatters_by_ft = {
        ["markdown.mdx"] = { "prettierd" },
        css = { "prettierd" },
        fish = { "fish_indent" },
        graphql = { "prettierd" },
        handlebars = { "prettierd" },
        html = { "prettierd" },
        javascript = { { "biome", "eslint_d", "prettierd" } },
        java = { "google-java-format" },
        javascriptreact = { { "biome", "eslint_d", "prettierd" } },
        json = { { "biome", "estlint_d", "prettierd" } },
        jsonc = { "prettierd" },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        python = { "black" },
        scss = { "prettierd" },
        sh = { "shfmt" },
        typescript = { { "biome", "eslint_d", "prettierd" } },
        typescriptreact = { { "biome", "eslint_d", "prettierd" } },
        vue = { "prettierd" },
        yaml = { "prettierd" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
        -- biome = {
        --   meta = {
        --     url = "https://github.com/biomejs/biome",
        --     description = "A toolchain for web projects, aimed to provide functionalities to maintain them.",
        --   },
        --   command = util.from_node_modules("biome"),
        --   stdin = true,
        --   args = { "format", "--stdin-file-path", "$FILENAME" },
        --   cwd = util.root_file({
        --     "biome.json",
        --   }),
        -- },
        -- prettierd = {
        --   meta = {
        --     url = "https://github.com/fsouza/prettierd",
        --     description = "prettier, as a daemon, for ludicrous formatting speed.",
        --   },
        --   command = util.from_node_modules("prettierd"),
        --   args = { "$FILENAME" },
        --   range_args = function(self, ctx)
        --     local start_offset, end_offset = util.get_offsets_from_range(ctx.buf, ctx.range)
        --     return { "$FILENAME", "--range-start=" .. start_offset, "--range-end=" .. end_offset }
        --   end,
        --   cwd = util.root_file({
        --     -- https://prettier.io/docs/en/configuration.html
        --     ".prettierrc",
        --     ".prettierrc.json",
        --     ".prettierrc.yml",
        --     ".prettierrc.yaml",
        --     ".prettierrc.json5",
        --     ".prettierrc.js",
        --     ".prettierrc.cjs",
        --     ".prettierrc.toml",
        --     "prettier.config.js",
        --     "prettier.config.cjs",
        --     "package.json",
        --   }),
        -- },
        ["google-java-format"] = {
          meta = {
            url = "https://github.com/google/google-java-format",
            description = "Reformats Java source code according to Google Java Style.",
          },
          command = "google-java-format",
          args = { "-" },
        },
      },
    }
    return opts
  end,
  config = M.setup,
}
