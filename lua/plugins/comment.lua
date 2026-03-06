return {
    "numToStr/Comment.nvim",
    event = "InsertEnter",
    config = function()
        require("Comment").setup({
            toggler = {
                line = '<leader>cc',
                block = '<leader>bc',
            },
            opleader = {
                line = '<leader>c',
                block = '<leader>b',
            },
        })
    end
}

