return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
      desc = 'LSP: Line Diagnostics'
    })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
      desc = 'LSP: Next Diagnostic'
    })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
      desc = 'LSP: Prev Diagnostic'
    })
    vim.keymap.set('n', [[\r]], ':LspRestart', {
      desc = 'LSP: Restart'
    })
    vim.keymap.set('n', [[\s]], ':LspStart', {
      desc = 'LSP: Start'
    })
    vim.keymap.set('n', [[\i]], ':LspInfo', {
      desc = 'LSP: Info'
    })
    vim.keymap.set('n', [[\l]], ':LspLog', {
      desc = 'LSP: Log'
    })

    require("lsp")
  end
}
