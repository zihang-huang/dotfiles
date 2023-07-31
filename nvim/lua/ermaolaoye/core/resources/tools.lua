return {
  -- add close buffer command
  {
    "moll/vim-bbye",
    event = { "BufRead" },
    keys = { { "<leader>d", "<cmd>Bdelete!<cr>", desc = "Close Buffer" } },
  },

  {
    "wakatime/vim-wakatime",
  }
}
