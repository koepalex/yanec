# yanec
Yet another neovim config

## Installation
### Load
Change into nvim config directory
* [Windows] %AppData%\..\Local\nvim
* [Linux] ~/.config/nvim

Clone the repository `git clone https://github.com/koepalex/yanec.git nvim`

### Language Server Protocol servers
The default configured LSP plugins are defined in [lsp-config.lua](./lua/plugins/lsp-config.lua), please update ensure_installed table.
Those plugins would run CLI tools, that need to be installed on the systems, please install them:
```pwsh
dotnet tool install --global csharp-ls
winget install lua-language-server
winget install Artempyanykh.Marksman
winget install editorconfig-checker.editorconfig-checker
...
```

### Formatter
The default configured formatters are defined in [non-ls.lua](./lua/plugins/none-ls.lua), please update the list if needed.
none-ls acts as a proxy LSP server, that using other formatters internally, those needs to be installed via mason `:Mason`.

### Build Markdown Preview
Execute manually (once) `:Lazy build markdown-preview.nvim`.
