-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.wrap = true

-- Only set PowerShell as shell on Windows
if vim.loop.os_uname().sysname == "Windows_NT" then
  opt.shell = "powershell.exe -NoLogo"
end
