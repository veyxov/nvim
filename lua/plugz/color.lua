local gruvbox = {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme 'gruvbox-material'
      end
    }

local catppuccin = { 
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd.colorscheme 'catppuccin'
    end
}

local tokyonight = {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
      vim.cmd.colorscheme 'tokyonight'
  end
}

return tokyonight
