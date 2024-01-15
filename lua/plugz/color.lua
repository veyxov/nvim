return {
  'crispybaccoon/evergarden',
  event = "VeryLazy",
  opts = {
    contrast_dark = 'hard',
    -- TODO: Override yank-highlight
  },
  config = function ()
      vim.cmd.colorscheme 'evergarden'
  end
}
