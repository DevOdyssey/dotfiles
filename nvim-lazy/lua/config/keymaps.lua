local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Increment/decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Delete a word backwards
map("n", "dw", 'vb"_d')

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
map("n", "<Leader>o", "o<Esc>^Da", opts)
map("n", "<Leader>O", "O<Esc>^Da", opts)

-- Split window
map("n", "ss", ":split<Return>", opts)
map("n", "sv", ":vsplit<Return>", opts)

-- Toggle InlayHints
map("n", "<Space>ci", require("help.etc").toggleInlayHints, { desc = "Toggle InlayHints" })
