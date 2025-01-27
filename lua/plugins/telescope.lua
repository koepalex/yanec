return {
    { "nvim-telescope/telescope.nvim", dependencies = "tsakirist/telescope-lazy.nvim" },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                  extensions = {
                    ["ui-select"] = {
                      require("telescope.themes").get_dropdown {
                      }
                  }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}
