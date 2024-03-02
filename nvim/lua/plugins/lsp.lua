local conf = require "help.config"

return {
  -- nvim-lsconfig
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    enabled = false,

    -- opts
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = conf.icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = conf.icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = conf.icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = conf.icons.diagnostics.Info,
          },
        },
      },
      inlay_hints = {
        enabled = false,
      },
      -- add any global capabilities here
      capabilities = {},
      -- options for vim.lsp.buf.format
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    },

    -- setup
  },
}
