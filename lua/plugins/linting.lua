return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters_by_ft = {
      -- yaml = { "yamllint" },
      ["yaml.cfn"] = { "cfn_lint" },
      ["yaml.ghaction"] = { "actionlint" },
    },
  },
}
