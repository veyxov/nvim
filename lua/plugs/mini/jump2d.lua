require('mini.jump2d').setup({
  labels = "etaoinshrdlcumwfgypbvkjxqz",
  view = {
    dim = true,
    n_steps_ahead = 2,
  }
})

map('s', function()
  MiniJump2d.start(MiniJump2d.builtin_opts.single_character)
  end, { 'o', 'x', 'n' }
)
