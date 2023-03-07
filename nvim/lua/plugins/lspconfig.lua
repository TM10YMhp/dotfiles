return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "nvim-lua/lsp-status.nvim"
  },
  config = function ()
    require("mason").setup({
      ui = {
        check_outdated_packages_on_open = false,
        border = "single",
        width = 0.8,
        height = 30,
        icons = {
          package_installed = "●",
          package_pending = "-",
          package_uninstalled = "○"
        }
      }
    })
    require("mason-lspconfig").setup()

    vim.keymap.set('n', [[\s]], ':LspStart')
    vim.keymap.set('n', [[\r]], ':LspRestart')
    vim.keymap.set('n', [[\i]], ':LspInfo')

    local lsp_status = require('lsp-status')
    lsp_status.register_progress()
    lsp_status.config({
      kind_labels = {},
      select_symbol = nil,
      current_function = true,
      show_filename = true,
      indicator_separator = ':',
      component_separator = ' ',
      indicator_errors = 'E',
      indicator_warnings = 'W',
      indicator_info = 'i',
      indicator_hint = '?',
      indicator_ok = 'LSP',
      spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
      status_symbol = ' |',
      diagnostics = true,
    })
    vim.opt.statusline:append("%{v:lua.require('lsp-status').status()} ")

    local lspconfig = require("lspconfig")
    require('lspconfig.ui.windows').default_options = {
      border = 'single',
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.tsserver.setup{
      --root_dir = lspconfig.util.root_pattern(
      --  "package.json", "tsconfig.json", "jsconfig.json", ".git"
      --),
      autostart = false,
      capabilities = capabilities,
      cmd = { "typescript-language-server", "--stdio" },
      init_options = {
        disableAutomaticTypingAcquisition = true,
        preferences = {
          quotePreference = "double",
          includeAutomaticOptionalChainCompletions = false,
          importModuleSpecifierPreference = "shortest",
          importModuleSpecifierEnding = "minimal",
          includeInlayParameterNameHints = "none",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayVariableTypeHints = false,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayEnumMemberValueHints = false,
        },
        tsserver = {
          logVerbosity = 'off',
          trace = 'off',
          useSyntaxServer = 'never'
        },
      },
      settings = {
        --completions = { completeFunctionCalls = true },
      }
    }

    lspconfig.astro.setup{
      autostart = false,
      capabilities = capabilities,
    }

    lspconfig.rust_analyzer.setup{
      autostart = false,
      capabilities = capabilities,
    }

    --[[lspconfig.tailwindcss.setup{
      autostart = false,
      settings = {
        tailwindCSS = {
          hovers = true,
          suggestions = false,
          emmetCompletions = false,
          colorDecorators = false,
          codeActions = false,
        }
      }
    }]]
  end
}
