-- [[ Configure NvimTree ]]
-- See `:help NvimTree`
-- local function my_on_attach(bufnr)
--   local api = require "nvim-tree.api"
--
--   local function opts(desc)
--     return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
--   end
--
--   -- default mappings
--   api.config.mappings.default_on_attach(bufnr)
--
--   -- custom mappings
--   -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
--   vim.keymap.set('n', '<leader>E', api.tree.open,   opts("open"))
--   vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
-- end

require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  -- on_attach = my_on_attach,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
