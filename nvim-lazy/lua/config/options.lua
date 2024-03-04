-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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

-- backup
opt.backup = false

-- etc
opt.title = true
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.scrolloff = 10
opt.shell = "bash"
opt.inccommand = "split"
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
opt.wrap = false -- No Wrap lines
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" }) -- Finding files - Search down into subfolders
opt.wildignore:append({ "*/node_modules/*" })
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.splitkeep = "cursor"
opt.mouse = "a"

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
