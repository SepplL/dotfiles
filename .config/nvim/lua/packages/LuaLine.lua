-- Set lualine as statusline
-- See `:help lualine.txt`
-- Fancier statusline
return { "nvim-lualine/lualine.nvim",
  dependencies = { "Mofiqul/dracula.nvim" },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        -- theme = 'neobones', handled automagically by colorscheme choice
        component_separators = '',
        section_separators = '',
        disabled_filetypes = {}
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    })
  end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
