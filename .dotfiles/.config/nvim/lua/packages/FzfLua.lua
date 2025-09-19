-- Fuzzy finder for lua
-- require('fzf-lua').files()

return { "ibhagwan/fzf-lua",
  -- popup for nice fzf looks
  dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
  config = function()
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
  end
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
