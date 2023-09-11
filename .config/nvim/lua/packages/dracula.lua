-- customize dracula theme and colors
-- no changes to colors
local dracula = require('dracula')
dracula.setup({
  show_end_of_buffer = true,
  transparent_bg = false,
  lualine_bg_color = '#44475a',  -- default: nil,
  italic_comment = true,
})
