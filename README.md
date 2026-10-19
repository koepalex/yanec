# yanec
Yet another neovim config

## Installation

Requires Neovim 0.12 or later. Plugins are installed through `vim.pack`.

### Load
Change into nvim config directory
* [Windows] %AppData%\..\Local\nvim
* [Linux] ~/.config/nvim

Clone the repository `git clone https://github.com/koepalex/yanec.git nvim`

### Language Server Protocol servers
Native LSP clients are enabled in [lsp-config.lua](./lua/plugins/lsp-config.lua).
`nvim-lspconfig` supplies server defaults; `vim.lsp.config()` supplies overrides.
Install the following executables separately and make them available on `PATH`:

| Server | Executable |
| --- | --- |
| Lua | `lua-language-server` |
| C# | `csharp-ls` |
| JSON | `vscode-json-language-server` |
| Markdown | `marksman` |
| YAML | `yaml-language-server` |
| Rust | `rust-analyzer` |
| Python | `pyright-langserver` |

Rust diagnostics use Clippy, which must be installed in the Rust toolchain.
Python uses Pyright for strict type checking across the workspace and completion,
and Ruff for linting.
Use `:checkhealth vim.lsp` to inspect enabled configurations and attached clients.

### Completion

[completions.lua](./lua/plugins/completions.lua) uses native automatic completion
for buffer words and LSP candidates, with a 100 ms delay.
Use `<C-Space>` to request LSP completion, `<C-n>` / `<C-p>` to select,
`<Tab>` (or `<C-y>`) to accept, and `<C-e>` to cancel. Tab accepts the first
candidate if none is selected. Without a completion menu, Tab jumps to the next
active snippet placeholder or inserts normal indentation. Enter inserts a newline.

LSP-provided snippets expand through `vim.snippet`; LuaSnip and
`friendly-snippets` are no longer loaded. Native completion does not discover
the `friendly-snippets` collection.

### Formatter

[formatting.lua](./lua/plugins/formatting.lua) configures Conform.
Install `stylua`, `csharpier`, `prettier`, `markdownlint`, and `yamlfmt`
separately. Project-local Prettier and CSharpier installations are also supported.
Use `<leader>f` to format manually; format-on-save is not enabled.
Markdown runs Prettier followed by markdownlint fixes. YAML uses yamlfmt.
Buffers without an available external formatter fall back to LSP formatting.
Use `:ConformInfo` to inspect formatter availability and errors.

### Linting

[lint.lua](./lua/plugins/lint.lua) runs Hadolint for Dockerfiles, Ruff for Python,
and Spectral for JSON/YAML when files are opened or saved.
Install `hadolint`, `ruff`, and `spectral`
separately and configure a Spectral ruleset for the project.
Diagnostics are displayed through `vim.diagnostic`.
Only enable these external tools in trusted projects.

### Tree-sitter

[treesitter.lua](./lua/plugins/treesitter.lua) uses `nvim-treesitter` on its
`main` branch to install parsers and queries. Highlighting uses
`vim.treesitter.start()`; indentation uses the plugin's indentation function.

Parser installation requires `curl`, `tar`, a C compiler, and `tree-sitter-cli`
0.26.1 or later, installed through a package manager rather than npm.
The first startup waits for parser installation, up to five minutes.
Updating the plugin through `vim.pack` also updates the configured parsers.
Use `:TSUpdate` to update parsers manually.

### Build Markdown Preview
Execute manually (once) `:Lazy build markdown-preview.nvim`.
