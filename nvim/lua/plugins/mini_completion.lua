return {
  "echasnovski/mini.completion",
  event = "InsertEnter",
  config = function()
    local opts = { expr = true }
    local keys = {
      ['cr']        = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
      ['c-y']    = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
      ['c-n_c-y'] = vim.api.nvim_replace_termcodes('<C-n><C-y>', true, true, true),
    }

    _G.cr_action = function()
      if vim.fn.pumvisible() ~= 0 then
        local item_selected = vim.fn.complete_info()['selected'] ~= -1
        return item_selected and keys['c-y'] or keys['c-n_c-y']
      else
        return keys['cr']
      end
    end

    vim.keymap.set('i', '<CR>', 'v:lua._G.cr_action()', opts)
    vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]], opts)
    vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<Tab>"]], opts)

    vim.opt.shortmess:append('c')

    require("mini.completion").setup({
      window = {
        info = { border = "single" },
        signature = { border = "single" },
      },
      mappings = {
        force_twostep = "<c-s>"
      },
      set_vim_settings = false
    })
  end
}
