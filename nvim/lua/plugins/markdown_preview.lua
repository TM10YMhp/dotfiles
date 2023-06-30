return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = "markdown",
  init = function()
    vim.g.mkdp_refresh_slow = 1
    vim.g.mkdp_preview_options = {
      disable_sync_scroll = 1
    }
    vim.g.mkdp_theme = 'dark'
  end
}
