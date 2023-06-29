# TM10YMhp dotfiles

**Advertencia**: No uses ciegamente mi configuración a menos que sepas lo que eso implica. ¡Úselo bajo su propio riesgo!

![screenshot nvim](./images/screenshot_nvim.jpg)

Si su memoria RAM es limitada modifique el [tamaño máximo de memoria de node](https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes).

Limitar la memoria puede llevar a comportamientos inesperados.

```bash
NODE_OPTIONS=--max-old-space-size=256
```

### Requerido

- neovim >= **0.9.1**
- git >= **2.19.0**
- node >= **18.14.0**
- npm >= **9.3.1**
- ripgrep >= **12.1.1**

### Opcional

- fd-find >= **8.2.1**
- tmux >= **3.3a**
- npm-check-updates
- @mryhryki/markdown-preview
- commitizen

## Neovim setup

Requiere [Neovim](https://neovim.io/) (>= 0.9.1)

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - A plugin manager for Neovim
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - A truecolor, solarized dark colorscheme
- [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - A blazing fast and easy to configure Neovim statusline written in Lua
- [junegunn/vim-easy-align](https://github.com/junegunn/vim-easy-align) - VSCode-like pictograms
- [echasnovski/mini.splitjoin](https://github.com/echasnovski/mini.splitjoin) - Snippet Engine for Neovim written in Lua
- [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround) - nvim-cmp source for neovim's built-in LSP
- [nvim-telescope/telescope-project.nvim](https://github.com/nvim-telescope/telescope-project.nvim) - nvim-cmp source for buffer words
- [debugloop/telescope-undo.nvim](https://github.com/debugloop/telescope-undo.nvim) - A completion engine plugin for neovim written in Lua
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP
- [olacin/telescope-cc.nvim](https://github.com/olacin/telescope-cc.nvim) - Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim
- [nvim-telescope/telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI
- [nvim-pack/nvim-spectre](https://github.com/nvim-pack/nvim-spectre) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim
- [ojroques/nvim-osc52](https://github.com/ojroques/nvim-osc52) - Lua `fork` of vim-web-devicons for neovim
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - A highly extendable fuzzy finder over lists
- [nvim-telescope/telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) - File Browser extension for telescope.nvim
- [echasnovski/mini.completion](https://github.com/echasnovski/mini.completion) - Autopairs
- [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm) - Use treesitter to auto close and auto rename html tag
- [folke/flash.nvim](https://github.com/folke/flash.nvim) - A high-performance color highlighter
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) - A snazzy bufferline
- [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers
- [numToStr/Comment.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration for buffers

### JDTLS

Necesitaras jdk 17 o superior para que funcione correctamente.

Se recomienda configurar lo siguiente:

```bash
JAVA_TOOL_OPTIONS=-Dfile.enconding=UTF-8
```

### Configuraciones para Windows

Posiblemente necesitaras descargar una fuente para que algunos plugins de neovim
se muestren correctamente. Puedes probar la fuente Menlo o Meslo, o cualquier otra fuente.

Necesitaras clink para el autocompletado y el prompt.

Las configuraciones de clink y neovim deben colocarse en `appdata/local`.

Para que los comandos de unix funcionen en windows necesitaras de [w64devkit](https://github.com/skeeto/w64devkit).

Si necesitas mas sutocompletados puedes buscar en [clink-completions](https://github.com/vladimir-kotikov/clink-completions).
