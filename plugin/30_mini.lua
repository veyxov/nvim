local now, later, lnmap, map = Cfg.now, Cfg.later, Cfg.lnmap, Cfg.map

local new_scratch_buffer = function()
        vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end
lnmap('ba', '<Cmd>b#<CR>')
lnmap('bs', new_scratch_buffer)

now(function()
        require 'mini.files'.setup({
                mappings = {
                        close       = 'qu',
                        go_in_plus  = '<right>',
                        go_out_plus = '<left>',
                        synchronize = '<cr>',
                }
        })
end)
map('-', '<Cmd>lua MiniFiles.open()<CR>')

now(function() require('mini.sessions').setup() end)
lnmap('rr', '<Cmd>lua MiniSessions.restart()<CR>')

later(function()
        require 'mini.pick'.setup {
                mappings = {
                        choose_in_split   = '<C-x>',
                        choose_in_vsplit  = '<C-v>',
                        choose_marked     = '<C-d>',

                        mark   = '<C-s>',
                        refine = '<C-n>'
                },
                options = { use_cache = true }
        }

end)
lnmap('t', '<cmd>lua MiniPick.builtin.files()<cr>')
lnmap('g', '<cmd>lua MiniPick.builtin.grep_live()<cr>')

later(function()
        require('mini.jump2d').setup({
                labels = 'etaioshrdlc',
                view = {
                        dim = true,
                        n_steps_ahead = 1,
                }
        })
end)

map('s', function()
  MiniJump2d.start(MiniJump2d.builtin_opts.single_character)
  end, { 'o', 'x', 'n' }
)
