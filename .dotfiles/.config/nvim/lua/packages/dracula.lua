-- customize dracula theme and colors
-- no changes to colors
-- use darcula colortheme
return { "Mofiqul/dracula.nvim",
  config = function()
    local dracula = require('dracula')
    dracula.setup({
      show_end_of_buffer = true,
      transparent_bg = false,
      lualine_bg_color = '#44475a',  -- default: nil,
      italic_comment = true,
    })
    vim.o.background = "dark"  -- or "dark" depending on colorscheme
    vim.cmd.colorscheme('dracula')

    function LineNumberColors()
      -- local pink = require("dracula").colors()["pink"]
      local orange = require("dracula").colors()["orange"]
      local gray = require("dracula").colors()["gray"]
      -- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg=gray, bold=true })
      -- vim.api.nvim_set_hl(0, 'LineNr', { fg=pink, bold=true })
      vim.api.nvim_set_hl(0, 'LineNr', { fg=orange, bold=true })
      -- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg=gray, bold=true })
    end
    return { LineNumberColors }

  end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
