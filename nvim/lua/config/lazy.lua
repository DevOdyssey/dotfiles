-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- lazy check
local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end

-- unset
vim.keymap.set("n", "s", "<nop>", { noremap = true, silent = true })

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

lazy.setup {
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  news = {
    neovim = false,
  },
}
