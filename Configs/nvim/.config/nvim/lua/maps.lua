local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

options = { noremap = true }
map('n', '<leader><esc>', ':nohlsearch<cr>', options)
map('n', '<leader><tab>n', ':tabnew<cr>', options)
map('n', '<leader><tab>d', ':tabclose<cr>', options)
map('n', '<leader><tab>]', ':tabnext<cr>', options)
map('n', '<leader><tab>[', ':tabprevious<cr>', options)
map('n', '<leader>w', "<C-w>", options)
map('i', 'jk', '<esc>', options)
map('n', '<leader>fs', ':w<cr>', options)
map('n', '<leader>qw', ':wq<cr>', options)
map('n', '<leader>qq', ':q!<cr>', options)
map('n', '<leader>h', ':help ', options)
map('n', '<leader>g', ':Git ', options)
map('n', '<leader>ot', ':NERDTreeCWD<cr>', options)
map('n', '<leader>fI', ':e ~/.config/dotfiles/Configs/nvim/.config/nvim/<cr>', options)
map('n', '<leader>.', ':e ', options)
map('n', '<leader><leader>', ':FZF<cr>', options)

map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)
map('v', 'j', 'gj', options)
map('v', 'k', 'gk', options)

map('n', '$', 'g$', options)
map('n', '0', 'g0', options)
map('v', 'j', 'gj', options)
map('v', 'j', 'gj', options)

vim.cmd("au FileType lua nnoremap <leader>c :source %<cr> <bar> :PaqInstall<cr>")
vim.cmd("au FileType java nnoremap <leader>e :s/\\(.*\\) \\(.*\\)(EntityManager em,\\{0,1\\}\\(.*\\))/\\1 \\2(\\3) { EntityManager em = null; try { em = BrokerUtil.getEntityManager(); return \\2(em, \\/*\\3*\\/); } finally { BrokerUtil.closeEntityManager(em); } }<cr>")
