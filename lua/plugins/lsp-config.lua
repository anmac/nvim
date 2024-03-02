local Util = require("util")

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      -- { "folke/neodev.nvim", opts = {} },
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = {
          ui = {
            border = "rounded",
            width = 0.6,
            height = 0.8,
          },
        },
        config = function(_, opts)
          require("mason").setup(opts)
          local mr = require("mason-registry")
          mr:on("package:install:success", function()
            vim.defer_fn(function()
              -- trigger FileType event to possibly load this newly installed LSP server
              require("lazy.core.handler.event").trigger({
                event = "FileType",
                buf = vim.api.nvim_get_current_buf(),
              })
            end, 100)
          end)
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        float = {
          focusable = true,
          border = "rounded",
          scope = "cursor",
          serverity_sort = true,
          source = "if_many",
        },
      },
      inlay_hints = { enabled = true },
      capabilities = {},
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {
        cssls = {},
        cssmodules_ls = {},
        dockerls = {},
        docker_compose_language_service = {},
        html = {},
        jsonls = {},
        jdtls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                enable = true,
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              format = {
                enable = true,
              },
              single_file_support = {
                enable = true,
              },
              hint = {
                enable = true,
                arrayIndex = "Auto",
                await = true,
                paramName = "All",
                paramType = true,
                semicolon = "SameLine",
              },
            },
          },
        },
        pyright = {},
        sqlls = {},
        tsserver = {},
        yamlls = {},
      },
      setup = {
      },
    },
    config = function(_, opts)
      if Util.has("neoconf.nvim") then
        local plugin = require("lazy.core.config").spec.plugins["neoconf.nvim"]
        require("neoconf").setup(require("lazy.core.plugin").values(plugin, "opts", false))
      end

      -- setup autoformat
      Util.format.register(Util.lsp.formatter())

      -- deprecated options
      if opts.autoformat ~= nil then
        vim.g.autoformat = opts.autoformat
        Util.deprecate("nvim-lspconfig.opts.autoformat", "vim.g.autoformat")
      end

      -- setup keymaps
      Util.lsp.on_attach(function(client, buffer)
        require("plugins.lsp.keymaps").on_attach(client, buffer)
      end)

      -- diagnostics
      for name, icon in pairs(require("config.icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      if opts.inlay_hints.enabled then
        Util.lsp.on_attach(function(client, buffer)
          if client.supports_method("textDocument/inlayHint") then
            Util.toggle.inlay_hints(buffer, true)
          end
        end)
      end

      if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
        opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
        or function(diagnostic)
          local icons = require("config.icons").diagnostics
          for d, icon in pairs(icons) do
            if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
              return icon
            end
          end
        end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      })

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end

      if Util.lsp.get_config("denols") and Util.lsp.get_config("tsserver") then
        local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        Util.lsp.disable("tsserver", is_deno)
        Util.lsp.disable("denols", function(root_dir)
          return not is_deno(root_dir)
        end)
      end

      -- diagnostic
      local diagnostic_goto = function(next, severity)
        local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
        severity = severity and vim.diagnostic.severity[severity] or nil
        return function()
          go({ severity = severity })
        end
      end
      vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
      vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
      vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
      vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
      vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
      vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
    end,
  }
}
