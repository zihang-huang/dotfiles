return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    'TobinPalmer/pastify.nvim',
    cmd = { 'Pastify' },
    keys = {
      {"<leader>fp", "<cmd>Pastify<cr>"}
    },
    config = function()
      require('pastify').setup {
        opts = {
          apikey = "YOUR API KEY (https://api.imgbb.com/)", -- Needed if you want to save online.
        },
      }
    end
  }
}
