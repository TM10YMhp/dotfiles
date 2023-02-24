return {
  "neovim/nvim-lspconfig",
  lazy = false,
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
        width = 0.7,
        height = 35,
        icons = {
          package_installed = "●",
          package_pending = "-",
          package_uninstalled = "○"
        }
      }
    })
    require("mason-lspconfig").setup()

    local lspconfig = require("lspconfig")
    require('lspconfig.ui.windows').default_options.border = 'single'

    local lsp_flags = { debounce_text_changes = 100 }
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.tsserver.setup{
      --autostart = false,
      flags = lsp_flags,
      capabilities = capabilities,
    }

    lspconfig.astro.setup{
      --autostart = false,
      flags = lsp_flags,
    }

    lspconfig.rust_analyzer.setup{
      --autostart = false,
      flags = lsp_flags,
    }

    lspconfig.tailwindcss.setup{
      --autostart = false,
      settings = {
        tailwindCSS = {
          hovers = true,
          suggestions = false,
          emmetCompletions = false,
          colorDecorators = false,
          codeActions = false,
        }
      }
    }
  end
}
