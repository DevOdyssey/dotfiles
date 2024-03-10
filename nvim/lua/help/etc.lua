local M = {}
M.cache = {}

function M.currentLsp()
  local buf_clients = vim.lsp.get_clients()
  local buf_client_names = {}
  for _, client in pairs(buf_clients) do
    table.insert(buf_client_names, client.name)
  end
  return table.concat(buf_client_names, "|")
end

function M.is_window()
  return vim.uv.os_uname().sysname:find("Windows") ~= nil
end

function M.telescope(name, opts)
  local params = { name = name, opts = opts }
  return function()
    name = params.name
    opts = params.opts
    opts = (opts or {})

    local cwd = (opts.cwd or vim.uv.cwd())
    if opts.cwd ~= nil and opts.cwd == false then
      cwd = vim.fn.expend("%:p:h")
    end

    if name == "find_files" and vim.uv.fs_stat(cwd .. "/.git") then
      opts.show_untracked = true
      name = "git_files"
    end

    require("telescope.builtin")[name](opts)
  end
end

function M.config_files()
  return M.telescope("find_files", { cwd = vim.fn.stdpath("config") })
end

function M.buffer_fzf()
  return function()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({ winblend = 10, previewer = false }))
  end
end

return M
