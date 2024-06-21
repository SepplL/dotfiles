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
-- in lua/mappings
