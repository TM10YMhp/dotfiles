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

    lspconfig.clangd.setup{
      autostart = false,
      capabilities = capabilities,
    }

    local jdtls_path = vim.fn.stdpath('data') .. "/mason/packages/jdtls"
    local workspace_path = vim.fn.stdpath('data') .. '/.cache/jdtls/workspace/'

    local path_to_lsp_server = jdtls_path .. "/config_win"
    local path_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = workspace_path .. project_name

    lspconfig.jdtls.setup{
      autostart = false,
      capabilities = capabilities,
      cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1G',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', path_jar,
        '-configuration', path_to_lsp_server,
        '-data', workspace_dir,
      },
      root_dir = lspconfig.util.root_pattern(
        ".git", "mvnw", "gradlew", "pom.xml", "build.gradle"
      ),
      settings = {
        java = {
          configuration = {
            updateBuildConfiguration = "disabled",
            maven = { userSettings = null }
          },
          errors = { incompleteClasspath = { severity = "warning" } },
          trace = { server = "off" },
          import = {
            gradle = { enabled = true },
            maven = { enabled = true },
            exclusions = {
              "**/node_modules/**",
              "**/.metadata/**",
              "**/archetype-resources/**",
              "**/META-INF/maven/**",
              "/**/test/**"
            }
          },
          referencesCodeLens = { enabled = false },
          signatureHelp = { enabled = false },
          implementationsCodeLens = { enabled = false },
          format = { enabled = true },
          saveActions = { organizeImports = false },
          contentProvider = { preferred = null },
          autobuild = { enabled = false },
        }
      }
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
