-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

-- Window navigation
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-J>", "<C-W>j")
vim.keymap.set("n", "<C-K>", "<C-W>k")
vim.keymap.set("n", "<C-L>", "<C-W>l")

-- Git
vim.keymap.set("n", "<F6>", ":G<CR>")

-- Buffer navigation
vim.keymap.set("n", "<leader><Space>", ":b#<CR>", { silent = true })
vim.keymap.set("n", "<BS><BS>", ":bd<CR>", { silent = true })
vim.keymap.set("n", "<leader><BS>", ":%bd|e#<CR>", { silent = true })
vim.keymap.set("n", "<tab>", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<s-tab>", ":bp<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":quit<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":update<CR>", { silent = true })

-- Git
vim.keymap.set("n", "<leader>k", ":G<CR>", { silent = true })

-- Exit insert mode
vim.keymap.set("i", "jj", "<Esc>")
