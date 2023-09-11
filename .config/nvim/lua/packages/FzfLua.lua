-- require('fzf-lua').files()
require('fzf-lua').setup({

	-- comment due to autoclose after opening fzf -> look into it later
	-- winopts = {
	-- 	width = 0.8,
	-- 	height = 0.8,
	-- 	yoffset = 0.5,
	-- 	xoffset = 0.5,
	-- },
	-- fzf_opts = {
	-- 	layout = 'reverse',
	-- 	info = 'inline',
	-- },
})  -- initialise package after lazy loading

-- define keybindings somewhere else in order to run properly
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require('fzf-lua').oldfiles()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('fzf-lua').grep()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>G', "<cmd>lua require('fzf-lua').git_files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Gb', "<cmd>lua require('fzf-lua').git_branches()<CR>", { noremap = true, silent = true })
