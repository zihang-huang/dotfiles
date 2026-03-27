-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

-- Always available, works in terminal + VSCode

map("n", "<leader>fw", "<cmd>w<cr><esc>", { desc = "Save Files" })
map("n", "<leader>fq", "<cmd>q<cr><esc>", { desc = "Quit" })
