local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

vim.api.nvim_set_keymap('i', 'jj', '<Esc>:<C-u>w<cr', opts)
--vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch')

vim.api.nvim_set_keymap('n', '<Leader>v', ':vs<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>s', ':sp<CR>', opts)

vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', opts)

vim.api.nvim_set_keymap('n', 'j', 'gj', opts)
vim.api.nvim_set_keymap('n', 'k', 'gj', opts)

-- telescope config
vim.api.nvim_set_keymap('n', "<Leader>fc", "<cmd>Telescope frecency<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>ff", "<cmd>Telescope find_files<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fg", "<cmd>Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fb", "<cmd>Telescope buffers<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- NERDTree
-- vim.api.nvim_set_keymap('n', "<Leader>e", "<cmd>NERDTreeToggle<CR>", opts)
vim.api.nvim_set_keymap('n', "<Leader>e", "<cmd>NvimTreeToggle<CR>", opts)

-- ToggleTerm
vim.api.nvim_set_keymap('n', "<Leader>tt", "<cmd>ToggleTerm<CR>", opts)
