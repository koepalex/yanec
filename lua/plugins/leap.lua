return {
    url = "https://codeberg.org/andyg/leap.nvim",
    event = "InsertEnter",
    config = function()
        require("leap").setup({})
    end
}
