-- TODO: can't overwite lspconfig.configs.gopls
--  modify direct
--  nvim-lspconfig/lua/lspconfig/server_configurations/gopls.lua
--  local mod_cache = nil -> local "$HOME/go/pkg/mod"
local gopls_config = function()
  local configs = require("lspconfig.configs")
  local util = require("lspconfig.util")
  local async = require("lspconfig.async")
  local mod_cache = "$HOME/go/pkg/mod"

  configs.gopls = {
    default_config = {
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = function(fname)
        if not mod_cache then
          local result = async.run_command("go env GOMODCACHE")
          if result and result[1] then
            mod_cache = vim.trim(result[1])
          end
        end
        if fname:sub(1, #mod_cache) == mod_cache then
          local clients = vim.lsp.Client["gopls"]
          if #clients > 0 then
            return clients[#clients].config.root_dir
          end
        end
        return util.root_pattern("go.work", "go.mod", ".git")(fname)
      end,
      single_file_support = true,
    },
    docs = {
      description = "Google's lsp server for golang.",
      default_config = {
        root_dir = [[root_pattern("go.work", "go.mod", ".git")]],
      },
    },
  }
end

gopls_config()
