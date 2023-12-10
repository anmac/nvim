local status_lsp_ok, lspconfig = pcall(require, "lspconfig")
if not status_lsp_ok then
  vim.notify("lspconfig plugin failed!")
  return
end

local status_mason_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_mason_ok then
  vim.notify("mason-lspconfig plugin failed!")
  return
end
local servers = mason_lspconfig.get_installed_servers()

local status_cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_nvim_lsp_ok then
  vim.notify("cmp_nvim_lsp capabilities plugin failed!")
  return
end
local capabilities = cmp_nvim_lsp.default_capabilities()

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr or vim.api.nvim_get_current_buf(),
    async = false,
  })
end

local on_attach = function(client, bufnr)
  if client.server_capabilities["documentSymbolProvider"] then
    require("nvim-navic").attach(client, bufnr)
  end
  -- if you want to set up formatting on save, you can use this as a callback
  -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  -- if client.supports_method("textDocument/formatting") then
  --   vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = augroup,
  --     buffer = bufnr,
  --     callback = function()
  --       lsp_formatting(bufnr)
  --     end,
  --   })
  -- end
  if client.name == "jdtls" then
    vim.lsp.codelens.refresh()
  end
end

for _, server in ipairs(servers) do
  local settings_status_ok, serverSettings = pcall(require, "user.lsp.settings." .. server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  if settings_status_ok then
    if serverSettings["settings"] then
      opts["settings"] = serverSettings["settings"]
    end
    if serverSettings["filetypes"] then
      opts["filetypes"] = serverSettings["filetypes"]
    end
  end

  if server ~= "jdtls" then
    lspconfig[server].setup(opts)
  end
end

vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = "#9e9e9e" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local function dopts(description)
      return { noremap = true, silent = true, buffer = args.buf, desc = description }
    end

    if client.server_capabilities.definitionProvider then
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, dopts("Go to definition"))
    end
    if client.server_capabilities.hoverProvider then
      vim.keymap.set("n", "K", vim.lsp.buf.hover, dopts("Display hover information"))
    end
    if client.server_capabilities.signatureHelpProvider then
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, dopts("Signature help"))
    end
    if client.server_capabilities.implementationProvider then
      vim.keymap.set("n", "gI", vim.lsp.buf.implementation, dopts("List Implementation"))
    end
    if client.server_capabilities.referencesProvider then
      vim.keymap.set("n", "gr", vim.lsp.buf.references, dopts("List References"))
    end
    if client.server_capabilities.codeActionProvider then
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, dopts("Select code action"))
    end
    if client.server_capabilities.renameProvider then
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, dopts("Rename reference"))
    end
    if client.server_capabilities.signatureHelpProvider then
      vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help, dopts("Signature help"))
    end
    if client.server_capabilities.documentFormattingProvider then
      vim.keymap.set("n", "<leader>cf", function()
        lsp_formatting()
      end, dopts("Format file"))
    end
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, dopts("Prev diagnostic"))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, dopts("Next diagnostic"))
    vim.keymap.set("n", "gl", function()
      vim.diagnostic.open_float({ scope = "line" })
    end, dopts("Open diagnostics float"))
  end,
})

local i = require("user.resources.diagnostics_icons")
local signs = {
  { name = "DiagnosticSignError", text = i.Error },
  { name = "DiagnosticSignWarn", text = i.Warn },
  { name = "DiagnosticSignHint", text = i.Hint },
  { name = "DiagnosticSignInfo", text = i.Info },
}
for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = true,
  float = {
    focusable = true,
    border = "rounded",
    scope = "cursor",
    serverity_sort = true,
    header = "",
    source = "always",
    prefix = "",
  },
  update_in_insert = true,
  serverity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local M = {}

local format_on_save = vim.api.nvim_create_augroup("format_on_save", { clear = true })

function M.toggle_format_on_save()
  if vim.fn.exists("#format_on_save#BufWritePre") == 1 then
    vim.api.nvim_clear_autocmds({ group = format_on_save })
    vim.notify("Format on save Disabled")
  else
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      group = format_on_save,
      callback = function()
        vim.lsp.buf.format({
          filter = function(client)
            return client.name == "null-ls"
          end,
          async = false,
        })
      end,
    })
    vim.notify("Format on save Enabled")
  end
end

vim.cmd([[ command! LspToggleAutoFormat execute "lua require('user.lsp.handlers').toggle_format_on_save()" ]])

return M
