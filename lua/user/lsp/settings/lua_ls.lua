return {
  Lua = {
    runtime = {
      version = "LuaJIT",
    },
    diagnostics = {
      globals = { "vim" },
    },
    workspace = {
      checkThirdParty = false,
      library = vim.api.nvim_get_runtime_file("", true),
    },
    telemetry = {
      enable = false,
    },
    format = {
      enable = false,
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
}
