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
  
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { 
      "kyazdani42/nvim-web-devicons",
      "stevearc/aerial.nvim",
    },
    opts = {
      options = {
        icons_enabled = true,
        disabled_filetypes = { "dashboard", "NvimTree"},
        theme = "tokyonight", 
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { {
          'buffers',
          mode = 0,
          use_mode_colors = true,
        } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {'tabs'},
        lualine_z = {'aerial'}
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
      },
      extensions = {
        "fugitive", "fzf", "aerial",
      },
    },
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
  
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Mason setup
      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {'lua_ls', 'intelephense'},
        handlers = {
          function(server_name)
            -- Special configuration for lua_ls
            if server_name == "lua_ls" then
              require('lspconfig').lua_ls.setup({
                settings = {
                  Lua = {
                    runtime = {
                      -- Tell the language server which version of Lua you're using
                      version = 'LuaJIT',
                    },
                    diagnostics = {
                      -- Get the language server to recognize the `vim` global
                      globals = {'vim'},
                    },
                    workspace = {
                      -- Make the server aware of Neovim runtime files
                      library = vim.api.nvim_get_runtime_file("", true),
                      checkThirdParty = false,
                    },
                    -- Do not send telemetry data
                    telemetry = {
                      enable = false,
                    },
                  },
                },
              })
            else
              require('lspconfig')[server_name].setup({})
            end
          end,
        },
      })
      
      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )
      
      -- LSP keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}
          
          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })
    end,
  },
  
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      
      return {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'nvim_lua' },
          { name = 'buffer' },
          { name = 'path' },
        })
      }
    end,
  },
  
  -- LuaSnip for snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
  },
  
  -- Uncomment if you want to use Copilot
  -- { "github/copilot.vim" },
}
