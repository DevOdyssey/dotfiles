local log = require "help.log"

local M = {}

function M.option(name, silent, values)
  if values then
    if vim.opt_local[name]:get() == values[1] then
      vim.opt_local[name] = values[2]
    else
      vim.opt_local[name] = values[1]
    end
    return log.info("Set " .. name .. " to " .. vim.opt_local[name]:get(), { title = "Option" })
  end

  vim.opt_local[name] = not vim.opt_local[name]:get()
  if not silent then
    if vim.opt_local[name]:get() then
      log.info("Enabled " .. name, { title = "Option" })
    else
      log.warn("Disabled " .. name, { title = "Option" })
    end
  end
end

local nu = { number = true, relativenumber = true }
function M.number(silent)
  if vim.o.number or vim.o.relativenumber then
    nu = { number = vim.o.number, relativenumber = vim.o.relativenumber }
    vim.o.number = false
    vim.o.relativenumber = false
    if not silent then
      log.warn("Disabled line numbers", { title = "Option" })
    end
  else
    vim.o.number = nu.number
    vim.o.relativenumber = nu.relativenumber
    if not silent then
      log.info("Enabled line numbers", { title = "Option" })
    end
  end
end

function M.diagnostics(silent)
  if not vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
    if not silent then
      log.info("Enabled diagnostics", { title = "Diagnostics" })
    end
  else
    vim.diagnostic.disable()
    if not silent then
      log.warn("Disabled diagnostics", { title = "Diagnostics" })
    end
  end
end

function M.inlay_hints(buf, silent, value)
  if value then
    value = not vim.lsp.inlay_hint.is_enabled(buf)
  end
  vim.lsp.inlay_hint.enable(buf, value)
  if not silent then
    if value then
      log.info "Enabled inlay hint"
    else
      log.warn "Disabled inlay hint"
    end
  end
end

setmetatable(M, {
  __call = function(m, ...)
    return m.option(...)
  end,
})

return M
