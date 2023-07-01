return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
      desc = 'LSP: Next Diagnostic'
    })
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
      desc = 'LSP: Prev Diagnostic'
    })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
      desc = 'LSP: Hover'
    })
    vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, {
      desc = 'LSP: Signature Help'
    })

    vim.keymap.set('n', '<leader>ce', vim.diagnostic.open_float, {
      desc = 'LSP: Line Diagnostics'
    })
    vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {
      desc = 'LSP: Format Document'
    })
    vim.keymap.set('n', '<leader>cn', vim.lsp.buf.rename, {
      desc = 'LSP: Rename'
    })

    vim.keymap.set('n', '<leader>lr', '<cmd>LspRestart<cr>', {
      desc = 'LSP: Restart'
    })
    vim.keymap.set('n', '<leader>ls', '<cmd>LspStart<cr>', {
      desc = 'LSP: Start'
    })
    vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>', {
      desc = 'LSP: Info'
    })
    vim.keymap.set('n', '<leader>ll', '<cmd>LspLog<cr>', {
      desc = 'LSP: Log'
    })

    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {
      desc = 'LSP: Add Workspace Folder'
    })
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, {
      desc = 'LSP: Remove Workspace Folder'
    })
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = 'LSP: List Workspace Folders'})

    require("lsp")
  end
}
