vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/MunifTanjim/nui.nvim",
      "https://github.com/rcarriga/nvim-notify",
      "https://github.com/folke/noice.nvim",
    }, { load = true })

    require("notify").setup({
      background_colour = require("tokyonight.colors").setup().bg,
    })

    require("noice").setup({
      routes = {
        {
          filter = { event = "msg_show", kind = { "shell_out", "shell_err", "shell_ret" } },
          view = "cmdline_output",
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    })
  end,
})
