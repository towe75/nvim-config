return {
  -- Gruvbox colorscheme
  {
    "morhetz/gruvbox",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  
  -- Tokyo Night colorscheme
  { "folke/tokyonight.nvim", },
  
  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "go", "lua", "php", "python", "vim", "vimdoc", "javascript", "typescript" },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  
  -- Aerial for code outline
  {
    "stevearc/aerial.nvim",
    opts = {},
  },
  
  -- Icons (already included as dependency above, but listing explicitly)
  { "kyazdani42/nvim-web-devicons" },
  
  -- Go language support
  { "fatih/vim-go", ft = "go" },
  
  -- Git plugins
  { "tpope/vim-fugitive" },
  { "shumphrey/fugitive-gitlab.vim", dependencies = { "tpope/vim-fugitive" } },
  
  -- Tpope's utilities
  { "tpope/vim-commentary" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-surround" },
  
  -- Syntax plugins
  { "martinda/Jenkinsfile-vim-syntax", ft = "Jenkinsfile" },
  { "udalov/kotlin-vim", ft = "kotlin" },
  { "Glench/Vim-Jinja2-Syntax", ft = "jinja" },
  
}
