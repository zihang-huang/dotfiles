return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = false, -- disables ruff LSP
        ruff_lsp = false, -- for older setups
      },
    },
  },
}
