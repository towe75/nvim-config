-- Copilot.lua plugin setup for Neovim
--
-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab AI CodeCompanion]])

return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        options = function()
            require("copilot").setup({
                suggestion = {
                    enabled = false,
                    auto_trigger = true,
                    keymap = {
                        accept = "<M-l>",
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>"
                    }
                },
                panel = {
                    enabled = false
                    --     auto_refresh = false,
                    --     keymap = {
                    --       jump_prev = "[[",
                    --       jump_next = "]]",
                    --       accept = "<CR>",
                    --       refresh = "gr",
                    --       open = "<M-CR>"
                    --     },
                    --     layout = {
                    --       position = "bottom",
                    --       ratio = 0.4
                },
                --   },
                --   filetypes = {
                --     yaml = false,
                --     markdown = false,
                --     help = false,
                --     gitcommit = false,
                --     gitrebase = false,
                --     hgcommit = false,
                --     svn = false,
                --     cvs = false,
                --     ["."] = false,
                --   },
                --   copilot_node_command = "node", -- Node.js version must be > 20
                server_opts_overrides = {}
            })
        end
    }, {
        "zbirenbaum/copilot-cmp",
        config = function() require("copilot_cmp").setup() end
    },
    {
        "olimorris/codecompanion.nvim",
        opts = {
            display = {
                chat = {
                    window = {
                        position = "right",
                    }
                }
            },
            extensions = {
              spinner = {},
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ravitemer/mcphub.nvim",
            "franco-ruggeri/codecompanion-spinner.nvim",
        },
        keys = {
          { "<leader>c", "<cmd>CodeCompanionChat toggle<CR>" },
        },
    },
    {
      'rcarriga/nvim-notify',
    },
    -- {
    --     "ravitemer/mcphub.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim"
    --     },
    --     --build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    --     config = function() require("mcphub").setup() end
    -- }
}
