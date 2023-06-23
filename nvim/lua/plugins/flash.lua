return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require("flash").setup({
      jump = { nohlsearch = false },
      highlight = { backdrop = false },
      modes = { char = { highlight = { backdrop = false } } }
    })
  end
}
