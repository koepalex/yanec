return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            local opts = {
                shell = "pwsh",
                direction = "vertical",
                start_in_insert = false,
                float_opts = {
                    border = "curved",
                },
                size = 120,
            }
            require("toggleterm").setup(opts)
        end,
    },
    {
        "ryanmsnyder/toggleterm-manager.nvim",
        dependencies = {
            "akinsho/nvim-toggleterm.lua",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            local toggleterm_manager = require("toggleterm-manager")
            local actions = toggleterm_manager.actions
            local opts = {
                mappings = {                                                -- key mappings bound inside the telescope window
                    i = {
                        ["<CR>"] = { action = actions.toggle_term, exit_on_action = true }, -- toggles terminal open/closed
                        ["<A-i>"] = { action = actions.create_and_name_term, exit_on_action = true }, -- creates a new terminal buffer
                        ["<A-d>"] = { action = actions.delete_term, exit_on_action = false }, -- deletes a terminal buffer
                        ["<A-r>"] = { action = actions.rename_term, exit_on_action = false }, -- provides a prompt to rename a terminal
                    },
                },
            }
            toggleterm_manager.setup(opts)
        end,
    },
}
