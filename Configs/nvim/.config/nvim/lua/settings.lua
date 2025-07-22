
local options = vim.o
local global_options = vim.go
local window_options = vim.wo
local buffer_options = vim.bo

--options.smartcase = true
--options.hlsearch = true
--options.incsearch = true
options = {
    smartcase = true,
    hlsearch = true,
    incsearch = true,
}

--window_options.relativenumber = true
--window_options.number = true
window_options = {
    relativenumber = true,
    number = true,
}

--options.tabstop = 4
--options.softtabstop = 4
--options.expandtab = true
--options.textwidth = 0
--options.wrap = true
--options.linebreak = true
--options.shiftwidth = 4
--options.autoindent = true
--options.smartindent = true
--options.backspace = "indent,eol,start"
--options.clipboard = "unnamedplus"
--options.shell = "bash"
--options.shellcmdflag = "-c"

options = {
    tabstop = 4,
    softtabstop = 4,
    expandtab = true,
    textwidth = 0,
    wrap = true,
    linebreak = true,
    shiftwidth = 4,
    autoindent = true,
    smartindent = true,
    backspace = "indent,eol,start",
    clipboard = "unnamedplus",
    shell = "bash",
    shellcmdflag = "-c",
    guifont = "FiraCode NF:h10",
}

--vim.lsp.enable('basedpyright')
vim.g.coq_settings = {
	auto_start = 'shut-up',
}

