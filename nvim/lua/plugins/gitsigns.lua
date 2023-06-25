return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    local gitsigns = require('gitsigns')
    gitsigns.setup({ preview_config = { row = 1 } })

    vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", {
      desc = "GitSigns Select Hunk"
    })
    vim.keymap.set("n", "]h", gitsigns.next_hunk, {
      desc = "Next Hunk"
    })
    vim.keymap.set("n", "[h", gitsigns.prev_hunk, {
      desc = "Prev Hunk"
    })
    vim.keymap.set("n", "<leader>hb", function()
      gitsigns.blame_line({ full = true })
    end, { desc = "Blame Line" })
    vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, {
      desc = "Undo Stage Hunk"
    })
    vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, {
      desc = "Preview Hunk"
    })
    vim.keymap.set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", {
      desc = "Stage Hunk"
    })
    vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", {
      desc = "Reset Hunk"
    })
    vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, {
      desc = "Stage Buffer"
    })
    vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, {
      desc = "Reset Buffer"
    })
  end
}
