-- Copilot.lua plugin setup for Neovim
-- See: https://github.com/zbirenbaum/copilot.lua
return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
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
    }, 
    {
        "zbirenbaum/copilot-cmp",
        config = function() require("copilot_cmp").setup() end
    }
}
