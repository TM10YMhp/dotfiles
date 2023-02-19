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

    local lsp_flags = { debounce_text_changes = 150 }
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.tsserver.setup{
      flags = lsp_flags,
      capabilities = capabilities
    }

    lspconfig.astro.setup{
      flags = lsp_flags,
    }

    lspconfig.rust_analyzer.setup{
      flags = lsp_flags,
    }

    lspconfig.tailwindcss.setup{
      settings = {
        tailwindCSS = {
          suggestions = false,
        }
      }
    }
  end
}
