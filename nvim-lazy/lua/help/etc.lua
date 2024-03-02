local M = {}

function M.toggleInlayHints()
  local newState = not vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(0, newState)
  if vim.notify then
    vim.notify("Inlay Hints Enable: " .. tostring(newState), "info")
  end
end

function M.currentLsp()
  local buf_clients = vim.lsp.get_clients()
  local buf_client_names = {}
  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end
  return table.concat(buf_client_names, "|")
end

function M.is_window()
  return vim.loop.os_uname().sysname:find("Windows")
end

return M
