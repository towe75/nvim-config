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
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "moon",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
    },
    -- Uncomment the line below to use Tokyo Night Moon instead of Gruvbox
    -- config = function() vim.cmd([[colorscheme tokyonight-moon]]) end,
  },
  
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
  
  -- Telescope for fuzzy finding
  -- moved to telescope.lua
  
  -- Telescope File Browser extension
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { 
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("file_browser")
    end,
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
  
  -- Diagnostics, errors, warnings
  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      position = "bottom",
      height = 10,
      icons = true,
      mode = "workspace_diagnostics",
      fold_open = "",
      fold_closed = "",
      group = true,
      padding = true,
      action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = {"<cr>", "<tab>"},
        open_split = {"<c-x>"},
        open_vsplit = {"<c-v>"},
        open_tab = {"<c-t>"},
        jump_close = {"o"},
        toggle_mode = "m",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        close_folds = {"zM", "zm"},
        open_folds = {"zR", "zr"},
        toggle_fold = {"zA", "za"},
        previous = "k",
        next = "j"
      },
      indent_lines = true,
      auto_open = false,
      auto_close = false,
      auto_preview = true,
      auto_fold = false,
      auto_jump = {"lsp_definitions"},
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
      },
      use_diagnostic_signs = false
    },
  },
}
