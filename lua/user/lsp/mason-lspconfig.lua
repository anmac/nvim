local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("mason-lspconfig plugin failed!")
  return
end

local servers = {
  "bashls",
  "clangd",
  "cmake",
  "cssls",
  "cssmodules_ls",
  "cucumber_language_server",
  "dockerls",
  "docker_compose_language_service",
  "eslint",
  "emmet_ls",
  "gopls",
  "groovyls",
  "html",
  "jsonls",
  "jdtls",
  "tsserver",
  "lua_ls",
  "marksman",
  "phpactor",
  "puppet",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "svelte",
  "taplo",
  "tailwindcss",
  "terraformls",
  "vimls",
  "volar",
  "vuels",
  "lemminx",
  "yamlls",
  "zls",
}

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})
