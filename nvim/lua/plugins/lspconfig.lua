return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
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

    local lspconfig = require("lspconfig")
    require('lspconfig.ui.windows').default_options = {
      border = 'single',
    }

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.tsserver.setup{
      --autostart = false,
      capabilities = capabilities,
      cmd = { "typescript-language-server", "--stdio" },
      init_options = {
        disableAutomaticTypingAcquisition = true,
        tsserver = {
          logVerbosity = 'off',
          trace = 'off',
          useSyntaxServer = 'never'
        },
      },
    }

    lspconfig.astro.setup{
      --autostart = false,
      capabilities = capabilities,
    }

    lspconfig.rust_analyzer.setup{
      --autostart = false,
      capabilities = capabilities,
    }

    --lspconfig.tailwindcss.setup{
    --  settings = {
    --    tailwindCSS = {
    --      hovers = true,
    --      suggestions = false,
    --      emmetCompletions = false,
    --      colorDecorators = false,
    --      codeActions = false,
    --    }
    --  }
    --}
  end
}
