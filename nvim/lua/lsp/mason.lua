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
vim.keymap.set('n', [[\l]], ':LspLog')
