local function project_root()
  return vim.fs.root(0, ".git") or vim.fn.getcwd()
end

local function project_path()
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then
    return "[No Name]"
  end
  local path = vim.fs.relpath(project_root(), name) or vim.fn.fnamemodify(name, ":~")
  return path .. (vim.bo.modified and " [+]" or "") .. (vim.bo.readonly and " [RO]" or "")
end

local function escape_statusline(text)
  return (text:gsub("%%", "%%%%"))
end

vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.pack.add({
      "https://github.com/nvim-tree/nvim-web-devicons",
      "https://github.com/nvim-lualine/lualine.nvim",
    }, { load = true })

    require("lualine").setup({
      options = {
        theme = "tokyonight",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            function()
              return vim.fs.basename(project_root())
            end,
            fmt = escape_statusline,
          },
          { project_path, fmt = escape_statusline },
          { "diagnostics", sources = { "nvim_diagnostic" } },
        },
        lualine_x = { "diff", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_c = { { project_path, fmt = escape_statusline } },
        lualine_x = { "location" },
      },
    })
  end,
})
