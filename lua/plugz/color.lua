-- vim.cmd.colorscheme 'retrobox'

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
      -- setups
      local opts = {
          transparent = true
      }
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight-night'
  end
}
