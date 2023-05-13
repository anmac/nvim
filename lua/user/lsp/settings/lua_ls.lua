return {
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
      library = {
        vim.api.nvim_get_runtime_file("", true),
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
      },
    },
    telemetry = {
      enable = false,
    },
    format = {
      enable = false,
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
}
