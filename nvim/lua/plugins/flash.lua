return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require("flash").setup({
      search = { multi_window = false },
      jump = { nohlsearch = false },
      highlight = { backdrop = false },
      modes = { char = { highlight = { backdrop = false } } }
    })
  end
}
