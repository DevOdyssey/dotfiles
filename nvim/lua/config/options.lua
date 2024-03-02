-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- auto format
vim.g.autoformat = true

-- utf-8
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

local opt = vim.opt

-- white-space render
opt.listchars = {
  tab = " →",
  eol = "⤶",
  lead = "·",
  trail = "·",
  extends = "◀",
  precedes = "▶",
}

-- lines number
opt.number = true
opt.relativenumber = true

-- indent
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.expandtab = true
opt.smarttab = true
opt.breakindent = true

-- etc
opt.autowrite = true
opt.backspace = { "start", "eol", "indent" }
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.cursorline = true
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.title = true
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 3
opt.scrolloff = 4
opt.shell = "bash"
opt.inccommand = "nosplit"
opt.ignorecase = true
opt.list = true
opt.mouse = "a"
opt.path:append { "**" } -- Finding files
opt.pumblend = 10
opt.pumheight = 10
opt.shiftround = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.spelllang = { "en", "ko" }
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.virtualedit = "block"
opt.wildignore:append { "*/node_modules/*" }
opt.winminwidth = 5
opt.wrap = false
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- Undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[4:0m"]]

if vim.fn.has "nvim-0.10" == 1 then
  opt.smoothscroll = true
end

-- Folding
-- vim.opt.foldlevel = 99
-- vim.opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
-- if vim.fn.has("nvim-0.9.0") == 1 then
--  vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
-- end
-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
-- if vim.fn.has("nvim-0.10") == 1 then
--  vim.opt.foldmethod = "expr"
--  vim.opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
-- else
-- vim.opt.foldmethod = "indent"
-- end
-- vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
-- vim.g.markdown_recommended_style = 0
