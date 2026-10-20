# yanec
Yet another neovim config

## Installation

Requires Neovim 0.12 or later. Plugins are installed through `vim.pack`.

### Load
Change into nvim config directory
* [Windows] %AppData%\..\Local\nvim
* [Linux] ~/.config/nvim

Clone the repository `git clone https://github.com/koepalex/yanec.git nvim`

### Appearance and buffer navigation

The editor uses TokyoNight Moon with a transparent background.
[bufferline.lua](./lua/plugins/bufferline.lua) loads Bufferline on `UIEnter`,
not during startup, and hides the tabline when only one buffer is open.
It displays buffer diagnostics and reserves space for the nvim-tree sidebar.
Use `<A-.>` / `<A-,>` to cycle buffers, `<A-1>` through `<A-9>` to select
their absolute positions, and `<A-0>` to select the last buffer.

[lualine.lua](./lua/plugins/lualine.lua) also loads on `UIEnter` and uses
TokyoNight's matching palette. It shows the Git branch, project root name,
project-relative file path, unsaved/read-only flags, buffer diagnostics, and
Git added/modified/removed line counts. The project root is the nearest Git
root, falling back to the current working directory outside a repository.
Files outside that root display their full path, shortened relative to home.

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
active snippet placeholder or inserts normal indentation. Enter does not accept
completion; it inserts a newline, expanding bracket pairs when appropriate.

LSP-provided snippets expand through `vim.snippet`; LuaSnip and
`friendly-snippets` are no longer loaded. Native completion does not discover
the `friendly-snippets` collection.

### Automatic pairs

[pairs.lua](./lua/plugins/pairs.lua) loads `mini.pairs` on the first `InsertEnter`.
It inserts matching brackets and quotes, skips existing closing characters,
and handles Backspace and Enter inside pairs. Native completion and Tab
acceptance remain unchanged.

### Command line and notifications

[noice.lua](./lua/plugins/noice.lua) loads Noice, nui.nvim, and nvim-notify
on `UIEnter` through `vim.pack`. The floating command line is centered, with its
completion menu positioned automatically. Presets keep search on the bottom line
and show long messages in a split.
Notifications use TokyoNight Moon's background color for fade animations,
avoiding missing background-highlight warnings when editor transparency is enabled.
Shell command output from `:!`, including stderr and exit-status messages, is also
shown in a split.
LSP documentation uses Tree-sitter rendering; completion remains native.
Use `:Noice` for message history and `:checkhealth noice` to check the setup.

### Git review and commits

[neogit.lua](./lua/plugins/neogit.lua) loads Neogit and Diffview through
`vim.pack` on the first Neogit or Diffview command, including command completion.
Diffview and Telescope are enabled as Neogit integrations; Telescope is loaded
with them if needed.

Use `<leader>gi` (`show Neo[gi]t UI`) to open Neogit's status view.
Use `<leader>gx` to close it.
Review the Untracked, Unstaged, and Staged sections; use `<Tab>` to expand
files and hunks, `s` to stage the item under the cursor, and `u` to unstage it.
Press `c` to open the commit popup and choose its commit action. Only staged
changes are included unless you explicitly enable a stage-all option.
Press `d` for the diff popup, then `u` for unstaged changes or `s` for staged
changes. These actions use Diffview for side-by-side review.

| Command or mapping | Review scope |
| --- | --- |
| `:DiffviewOpen` | Unstaged and staged changes in separate file-panel sections, plus untracked files by default |
| `:DiffviewOpen --cached` | Staged changes only, compared with `HEAD` |
| `:DiffviewOpen HEAD` | Combined working-tree changes compared with `HEAD`, without separating staged and unstaged portions |
| `<leader>df` (`:DiffviewFileHistory`) | Committed history across the repository, not pending changes |
| `:DiffviewFileHistory %` | Committed history of the current file |

In Diffview, use `<Tab>` / `<S-Tab>` to cycle through files and `<leader>dx` (`:DiffviewClose`)
to return to the previous tab. Save edited buffers before reviewing so Git sees
their latest contents.

### Fuzzy finding

[telescope.lua](./lua/plugins/telescope.lua) loads Telescope on the first
`:Telescope` command, command completion, `<leader>ff` (find files), or
`<leader>lg` (live grep). The first `vim.ui.select` call also loads Telescope
and uses its dropdown picker. These plugins are not loaded during startup.

### Code outline

[aerial.lua](./lua/plugins/aerial.lua) loads `aerial.nvim` through `vim.pack`
with default settings, using Tree-sitter or LSP for document symbols.
Use `<leader>a` (`toggle [a]erial view`) to run `:AerialToggle!`, opening or
closing the outline without moving focus from the current window.

### Todo comments

[todo-comments.lua](./lua/plugins/todo-comments.lua) loads `todo-comments.nvim`
and its Plenary dependency through `vim.pack`. It highlights markers such as
`TODO:`, `FIXME:`, and `HACK:`.
Use `<leader>st` (`[s]how [t]odos`) to run `:TodoQuickFix` and list project
markers in the quickfix window. Searching requires `ripgrep` (`rg`) on `PATH`.

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
Parsers are not installed during normal startup. Run this command inside Neovim
to install the configured parsers for Lua, C#, Markdown (including inline syntax),
Mermaid, Rust, YAML, JSON, Vim, regex, and Bash:

```vim
:TSInstall lua c_sharp markdown markdown_inline mermaid rust yaml json vim regex bash
```

Wait for installation to finish before opening files that need these parsers.
Updating the plugin through `vim.pack` also updates the configured parsers.
Use `:TSUpdate` to update parsers manually.

### Build Markdown Preview
Execute manually (once) `:Lazy build markdown-preview.nvim`.
