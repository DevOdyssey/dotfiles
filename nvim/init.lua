if vim.g.vscode then
  require("vscode")
else
  require("config.lazy")

  require("config.options")
  require("config.autocmds")
  require("config.keymaps")
end

