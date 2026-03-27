-- bootstrap lazy.nvim, LazyVim and your plugins
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk", noremap = true, silent = true })

vim.o.timeout = true
vim.o.timeoutlen = 200

require("config.lazy")
