return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      "stevearc/aerial.nvim",
      "folke/tokyonight.nvim",
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
}
