return {
  -- Telescope for fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    keys = { 
        { "<C-P>", "<cmd>Telescope find_files<CR>" },
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
