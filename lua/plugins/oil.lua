return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "InsertEnter",
    config = function()
        local options = {
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
            },
            view_options = {
                show_hidden = true,
           }
        }
        require("oil").setup(options)
    end
}
