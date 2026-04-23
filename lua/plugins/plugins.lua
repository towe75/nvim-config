return {
  -- colorschemes
  {"rebelot/kanagawa.nvim", },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000,
  config = function()
    vim.cmd([[colorscheme kanagawa]])
  end,
  },
  { "morhetz/gruvbox", },

  { "folke/tokyonight.nvim", },
    
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
