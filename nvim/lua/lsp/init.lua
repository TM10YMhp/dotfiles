require("lsp.mason")
require("lsp.lsp_status")

local lspconfig = require("lspconfig")

require('lspconfig.ui.windows').default_options = {
  border = 'single',
}

local defaults = {
  autostart = false,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function()
    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
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
