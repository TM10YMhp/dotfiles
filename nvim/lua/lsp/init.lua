require("lsp.mason")

local lspconfig = require("lspconfig")

require('lspconfig.ui.windows').default_options = {
  border = 'single',
}

local defaults = {
  autostart = false,
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', '')

    local opts = { buffer = bufnr }

    vim.keymap.set('n', '<leader>=', vim.lsp.buf.format,
      vim.tbl_extend('force', opts, { desc = 'LSP: Format Document'})
    )
    vim.keymap.set('n', 'K', vim.lsp.buf.hover,
      vim.tbl_extend('force', opts, { desc = 'LSP: Hover'})
    )
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,
      vim.tbl_extend('force', opts, { desc = 'LSP: Rename'})
    )
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.add_workspace_folder,
      vim.tbl_extend('force', opts, { desc = 'LSP: Add Workspace Folder'})
    )
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.remove_workspace_folder,
      vim.tbl_extend('force', opts, { desc = 'LSP: Remove Workspace Folder'})
    )
    vim.keymap.set('n', '<leader>cl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend('force', opts, { desc = 'LSP: List Workspace Folders'}))
  end
}

local dir = "servers"
local config_path = vim.fn.stdpath("config") .. "/lua/"
local files = vim.fn.split(vim.fn.glob(config_path .. dir .. "/*.lua", "\n"))

for _, file in pairs(files) do
  local name_file = vim.fn.fnamemodify(file, ":t:r")
  local server = require(dir .. "." .. name_file)
  if type(server) == "table" then
    local enabled = not (server.enabled == false)
    if enabled then
      if type(server.setup) == "function" then
        local opts = server.setup(lspconfig)
        local setup = vim.tbl_deep_extend("force", defaults, opts)
        local name = server[1]
        lspconfig[name].setup(setup)
      else
        for _, name in ipairs(server) do
          if type(name) == "string" then lspconfig[name].setup(defaults) end
        end
      end
    end
  end
end
