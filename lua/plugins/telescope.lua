return {
  -- Telescope for fuzzy finding
  {"nvim-lua/plenary.nvim", lazy = true},
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
        file_ignore_patterns = {
          "node_modules",
          "plz-out" 
        }
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
        },
      },
    },
    keys = {
      { "<C-P>", "<cmd>Telescope find_files<CR>" },
      {"<leader>p", function() require("telescope.builtin").find_files({ cwd = vim.fn.expand('%:p:h') }) end, desc = "Find Files (cwd: current file dir)"},
      {"<leader>o", function() require("telescope").extensions.file_browser.file_browser({ cwd = vim.fn.expand('%:p:h') }) end, desc = "File Browser (cwd: current file dir)"},
      {"<leader>g", function() require("telescope.builtin").git_files({ cwd = vim.fn.expand('%:p:h') }) end, desc = "Git Files (cwd: current file dir)"},
      {"<leader>f", "<cmd>Telescope live_grep<CR>", desc = "Live Grep"},
      {"<leader><F6>", function() require("telescope.builtin").git_bcommits({ cwd = vim.fn.expand('%:p:h') }) end, desc = "Git Buffer Commits (cwd: current file dir)"},
      {"<F7>", function() require("telescope.builtin").git_branches({ cwd = vim.fn.expand('%:p:h') }) end, desc = "Git Branches (cwd: current file dir)"},
      {"<leader><F7>", function() require("telescope.builtin").git_bcommits() end, desc = "Git Buffer Commits (all)"},
      {"<leader>s", function() require("telescope.builtin").lsp_document_symbols() end, desc = "LSP Document Symbols"},
      {"<leader><Tab>", "<cmd>Telescope buffers<CR>", desc = "Buffers"},
    },
  },
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
}
