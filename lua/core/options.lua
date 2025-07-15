-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- General settings
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard = "unnamedplus"  -- Windows clipboard integration
vim.opt.syntax = "on"
vim.opt.fileformats = "unix,dos"
vim.opt.expandtab = true
vim.opt.autowrite = true
vim.opt.encoding = "utf-8"
vim.opt.laststatus = 2
vim.opt.showmode = false  -- We don't need to see things like -- INSERT -- anymore

-- Indentation
vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Visual indicators
vim.opt.list = true  -- Show invisible characters
vim.opt.listchars = {tab = '› ', eol = '¬', trail = '⋅'}
vim.opt.showmatch = true  -- Highlight matching braces
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"  -- Reserve space for signs in the gutter

-- File management
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.wildignore:append("*.pyc")

-- Mouse
vim.opt.mouse = "a"

-- Tab display
vim.opt.showtabline = 1

-- Line numbers
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Search
vim.opt.grepprg = "rg --vimgrep --smart-case --follow"
vim.opt.wildcharm = 9  -- <Tab>
vim.opt.wildmenu = true
vim.opt.wildmode = "full"

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- GitLab configuration
vim.g.fugitive_gitlab_domains = {'https://git.in.pascom.net'}

-- File type specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"yaml", "nomad", "hcl", "lua"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.jenkins", "*.Jenkins"},
  callback = function()
    vim.bo.filetype = "Jenkinsfile"
  end
})

-- Toggle line highlight when enter/leave insert mode
vim.api.nvim_create_autocmd({"InsertEnter", "InsertLeave"}, {
  callback = function()
    vim.opt.cursorline = not vim.opt.cursorline:get()
  end
})
