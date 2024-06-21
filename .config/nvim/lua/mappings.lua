-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.api.nvim_set_keymap("n", "[d", "<cmd> vim.diagnostic.goto_prev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "]d", "<cmd> vim.diagnostic.goto_next<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd> vim.diagnostic.open_float<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd> vim.diagnostic.setloclist<CR>", { noremap = true, silent = true })

-- set shortcut for disable highlighting noh
vim.api.nvim_set_keymap( "n", "<esc><esc>", ":noh<cr>", {
  noremap = true}
)

-- set spell suggestions
vim.keymap.set("n", "<leader>s", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
end, { desc = "Spelling Suggestions" })

-- fzf mappings
vim.api.nvim_set_keymap('n', '<leader>f', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require('fzf-lua').oldfiles()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', "<cmd>lua require('fzf-lua').grep()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>G', "<cmd>lua require('fzf-lua').git_files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Gb', "<cmd>lua require('fzf-lua').git_branches()<CR>", { noremap = true, silent = true })
