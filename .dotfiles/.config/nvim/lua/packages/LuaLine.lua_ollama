-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'dracula',
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
  extensions = {},
  optional = true,
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, {
      function()
        local status = require("ollama").status()

        if status == "IDLE" then
          return "󱙺" -- nf-md-robot-outline
        elseif status == "WORKING" then
          return "󰚩" -- nf-md-robot
        end
      end,
      cond = function()
        return package.loaded["ollama"] and require("ollama").status() ~= nil
      end,
    })
  end,
})
