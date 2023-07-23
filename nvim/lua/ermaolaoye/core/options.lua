local options = {
  -- no backup files
  backup = false,

  -- line numbers
  relativenumber = true,
  number = true,

  -- tabs & indentation
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,

  -- search settings
  ignorecase = true,
  smartcase = true,

  -- cursorline
  cursorline = true,

  --appearance
  termguicolors = true,
  background = "dark",
  signcolumn = "yes",

  -- backspace
  backspace = "indent,eol,start",

  -- global status line
  laststatus = 3,

  -- use system clipboard
  clipboard = "unnamedplus",

  -- split windows
  splitright = true,
  splitbelow = true,

  -- more space in the command line for displaying message
  cmdheight = 0,

  -- allow mouse
  mouse = "a",

  -- display
  showmode = false,
  showtabline = 0,
  wrap = true, -- wrap long line

  -- misc
  confirm = true, -- no more bullshitting about saving the current buffer when exiting
  fileencoding = "utf-8",
  timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 500, -- faster completion (4000ms default)
  title = true,
  mousemoveevent = true,
  syntax = "off",
}
-- remove the ~ symbol in blank line
vim.api.nvim_set_option('fillchars', 'eob: ')

for k, v in pairs(options) do
  vim.opt[k] = v
end

if vim.g.neovide then
  vim.opt.guifont = "CaskaydiaCove Nerd Font:h13" -- the font used in graphical neovim applications
  vim.g.neovide_scale_factor = 1
end
