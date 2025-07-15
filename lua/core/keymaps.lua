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

-- LSP document symbols
vim.keymap.set("n", "<leader>s", function()
  require("telescope.builtin").lsp_document_symbols()
end, { silent = true })

-- Buffer navigation
vim.keymap.set("n", "<leader><Tab>", "<cmd>Telescope buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader><Space>", ":b#<CR>", { silent = true })
vim.keymap.set("n", "<BS><BS>", ":bd<CR>", { silent = true })
vim.keymap.set("n", "<leader><BS>", ":%bd|e#<CR>", { silent = true })
vim.keymap.set("n", "<tab>", ":bn<CR>", { silent = true })
vim.keymap.set("n", "<s-tab>", ":bp<CR>", { silent = true })

-- Git
vim.keymap.set("n", "<leader>k", ":G<CR>", { silent = true })

-- Exit insert mode
vim.keymap.set("i", "jj", "<Esc>")

-- Trouble plugin keymaps
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, { silent = true })
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end, { silent = true })
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end, { silent = true })
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end, { silent = true })
