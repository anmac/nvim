return {

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[9] = { "<c-K>", false }
      vim.list_extend(keys, {
        {
          "<C-p>",
          function()
            Snacks.picker.lsp_symbols({
              filter = {
                default = {
                  "Class",
                  "Constructor",
                  "Enum",
                  "Function",
                  "Method",
                  "Property",
                  "Struct",
                  "Trait",
                },
                markdown = false,
                help = false,
                lua = {
                  "Class",
                  "Constructor",
                  "Enum",
                  "Function",
                  "Method",
                  "Property",
                  "Struct",
                  "Trait",
                },
              },
            })
          end,
          desc = "LSP Functions/Methods",
          has = "documentSymbol",
        },
      })
    end,
    opts = {
      diagnostics = {
        float = {
          focusable = true,
          border = "rounded",
          scope = "cursor",
          severity_sort = true,
          source = "if_many",
        },
      },
      inlay_hints = {
        enabled = false,
      },
      servers = {
        yamlls = {
          filetypes = {
            "yaml",
            "yaml.docker-compose",
            "yaml.ghaction",
            "yaml.gitlab",
            "yaml.bitbucket",
            "yaml.helm-values",
            "yaml.cfn",
          },
          settings = {
            yaml = {
              customTags = {
                "!Base64 scalar",
                "!Cidr scalar",
                "!And sequence",
                "!Equals sequence",
                "!If sequence",
                "!Not sequence",
                "!Or sequence",
                "!Condition scalar",
                "!FindInMap sequence",
                "!ForEach sequence",
                "!GetAtt scalar",
                "!GetAtt sequence",
                "!GetAZs scalar",
                "!ImportValue scalar",
                "!Join sequence",
                "!Select sequence",
                "!Split sequence",
                "!Sub scalar",
                "!ToJsonString mapping",
                "!Transform mapping",
                "!Ref scalar",
                "Fn::Base64 scalar",
                "Fn::Cidr scalar",
                "Fn::And sequence",
                "Fn::Equals sequence",
                "Fn::If sequence",
                "Fn::Not sequence",
                "Fn::Or sequence",
                "Fn::Condition scalar",
                "Fn::FindInMap sequence",
                "Fn::ForEach sequence",
                "Fn::GetAtt scalar",
                "Fn::GetAtt sequence",
                "Fn::GetAZs scalar",
                "Fn::ImportValue scalar",
                "Fn::Join sequence",
                "Fn::Select sequence",
                "Fn::Split sequence",
                "Fn::Sub scalar",
                "Fn::ToJsonString mapping",
                "Fn::Transform mapping",
                "Ref scalar",
              },
            },
          },
        },
      },
    },
  },

  -- mason
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
        width = 0.6,
        height = 0.8,
      },
      ensure_installed = { "biome", "google-java-format" },
    },
  },
}
