return {
  "nvim-pack/nvim-spectre",
  event = "VeryLazy",
  config = function()
    require("spectre").setup({ color_devicons = false })

    vim.keymap.set('n', '<leader>S',
      '<cmd>lua require("spectre").open()<CR>', {
      desc = "Open Spectre"
    })
    vim.keymap.set('n', '<leader>sw',
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
      desc = "Search current word"
    })
    vim.keymap.set('v', '<leader>sw',
      '<esc><cmd>lua require("spectre").open_visual()<CR>', {
      desc = "Search current word"
    })
    vim.keymap.set('n', '<leader>sp',
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
      desc = "Search on current file"
    })
  end
}
