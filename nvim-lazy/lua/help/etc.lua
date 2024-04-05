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

function M.zls_path()
  if M.is_window() then
    return "C:/tools/zig/zls.exe"
  else
    return "$HOME/.local/zig/zls"
  end
end

function M.has_buildable()
  if M.is_window() then
    return vim.fn.executable("cmake") == 1
  end
  return vim.fn.executable("make") == 1
end

function M.fzf_build_cmd()
  if M.is_window() then
    return "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  end
  return "make"
end

return M
