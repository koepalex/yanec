return {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
        require("leap").setup({})
    end
}
