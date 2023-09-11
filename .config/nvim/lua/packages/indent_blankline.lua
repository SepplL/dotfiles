-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`

vim.opt.list = true
vim.opt.listchars:append "eol:↴"


require('indent_blankline').setup {
  -- char = '┊',
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
  show_end_of_line = true,
}
