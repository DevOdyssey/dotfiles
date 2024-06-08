-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("lazyvim_json_conceal", { clear = true }),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- force eof=lf
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  command = "set fileformat=unix",
})

-- rust tabspace
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  command = "setlocal shiftwidth=2",
})
