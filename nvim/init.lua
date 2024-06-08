if vim.g.vscode then
  require("vs")
else
  require("config.lazy")

  require("config.options")
  require("config.autocmds")
  require("config.keymaps")
end

