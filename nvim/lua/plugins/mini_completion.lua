return {
  "echasnovski/mini.completion",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local opts = { expr = true }
    local keys = {
      ['cr']        = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
      ['ctrl-y']    = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
      ['ctrl-y_cr'] = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
    }

    _G.cr_action = function()
      if vim.fn.pumvisible() ~= 0 then
        local item_selected = vim.fn.complete_info()['selected'] ~= -1
        return item_selected and keys['ctrl-y'] or keys['ctrl-y_cr']
      else
        return keys['cr']
      end
    end

    vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', opts)
    vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]], opts)
    vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<Tab>"]], opts)

    require("mini.completion").setup({
      window = {
        info = { border = "single" },
        signature = { border = "single" },
      },
      mappings = {
        force_twostep = "<c-s>"
      }
    })
  end
}
