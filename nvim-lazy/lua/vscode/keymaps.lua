-- keymaps for vscode
local function map(m, l, r, msg)
  vim.keymap.set(m, l, r, { desc = msg, remap = false, silent = true })
end

-- TODO: navigate keymaps for vscode

-- map({ "n", "v" }, "<C-h>", "<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>", "Navigate Left")
-- map({ "n", "v" }, "<C-j>", "<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>", "Navigate Down")
-- map({ "n", "v" }, "<C-k>", "<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>", "Navigate Up")
-- map({ "n", "v" }, "<C-l>", "<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>", "Navigate Right")
