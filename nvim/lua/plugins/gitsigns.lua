return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    local gs = require('gitsigns')
    gs.setup({ preview_config = { row = 1 } })

    vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", {
      desc = "GitSigns Select Hunk"
    })
    vim.keymap.set("n", "]h", gs.next_hunk, {
      desc = "Next Hunk"
    })
    vim.keymap.set("n", "[h", gs.prev_hunk, {
      desc = "Prev Hunk"
    })
    vim.keymap.set("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, { desc = "Blame Line" })
    vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, {
      desc = "Undo Stage Hunk"
    })
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, {
      desc = "Preview Hunk"
    })
    vim.keymap.set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", {
      desc = "Stage Hunk"
    })
    vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", {
      desc = "Reset Hunk"
    })
    vim.keymap.set("n", "<leader>hS", gs.stage_buffer, {
      desc = "Stage Buffer"
    })
    vim.keymap.set("n", "<leader>hR", gs.reset_buffer, {
      desc = "Reset Buffer"
    })
  end
}
