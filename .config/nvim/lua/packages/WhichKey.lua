local wk = require('which-key')

wk.register({
  -- f = {
  --   name = 'file',
  --   f = { '<cmd>lua require("fzf-lua").files()<CR>', 'Find File' },
  --   r = { 'Open Recent Files' },
  --   ['1'] = 'which_key_ignore',
  -- },
}, { prefix = '<leader>' })

wk.setup({
  -- config for which-key
})
