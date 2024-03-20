return {
  -- mason
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.PATH = "append"
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "codelldb",

        -- go
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",

        -- zig
        "zls",

        -- odin
        "ols",
      })
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {

      -- servers
      servers = {

        -- lua_ls
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
              codeLens = {
                enable = true,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },

        -- gopls

        -- zls
        zls = {
          cmd = { "zls" },
        },
      },
    },
  },
}
