
local options = vim.o
local global_options = vim.go
local window_options = vim.wo
local buffer_options = vim.bo

options.smartcase = true
options.hlsearch = true
options.incsearch = true

window_options.relativenumber = true
window_options.number = true

options.tabstop = 4
options.softtabstop = 4
options.expandtab = true
options.textwidth = 0
options.wrap = true
options.linebreak = true
options.shiftwidth = 4
options.autoindent = true
options.smartindent = true
options.backspace = "indent,eol,start"
options.clipboard = "unnamedplus"
options.shell = "bash"
options.shellcmdflag = "-c"

options.guifont = "FiraCode NF:h10"
