-- vim: foldmethod=marker foldlevel=0
local now, later, lnmap, map, cmap, lncmap, now_if_args = Cfg.now, Cfg.later, Cfg.lnmap, Cfg.map, Cfg.cmap, Cfg.lncmap, Cfg.now_if_args

--{{{pick
later(function()
        require 'mini.pick'.setup {
                mappings = {
                        choose_in_split   = '<C-x>',
                        choose_in_vsplit  = '<C-v>',
                        choose_marked     = '<C-d>',

                        mark   = '<C-s>',
                        refine = '<C-n>',
                        move_down = '' -- clashes with the above
                },
                options = { use_cache = true }
        }

end)
lncmap('t', 'lua MiniPick.builtin.files()')
cmap('??', 'lua MiniPick.builtin.grep_live()')
--}}}

--{{{jump2d
later(function()require 'mini.jump'.setup() end)
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
--}}}

--{{{files
map('-', function()
        if not MiniFiles then
                require('mini.files').setup({
                        mappings = {
                                close       = 'qu',
                                go_in_plus  = '<right>',
                                go_out_plus = '<left>',
                                synchronize = '<cr>',
                        }
                })
        end
        MiniFiles.open()
end)
--}}}

--{{{sessions
later(function() require('mini.sessions').setup() end)
lncmap('sr', 'lua MiniSessions.restart()')
lncmap('sw', 'lua MiniSessions.write()')
--}}}

--{{{ui
later(function() require 'mini.icons'       .setup() end)
-- later(function() require('mini.tabline')    .setup() end)
later(function() require('mini.statusline') .setup() end)
later(function() require('mini.indentscope').setup() end)
now(function() require('mini.notify').setup() end)
--}}}

--{{{extra
later(function() require('mini.extra').setup() end)
later(function() require('mini.align').setup() end)

later(function()
        require('mini.bracketed').setup( {quickfix   = { suffix = '<Leader>', options = {} },})
end)

later(function()
        require 'mini.splitjoin'.setup({mappings = {toggle = 'S'}})
end)
later(function() require 'mini.trailspace'.setup() end)
lnmap('ds', function() MiniTrailspace.trim(); MiniTrailspace.trim_last_lines(); end)
--}}}

--{{{objects
later(function()
        local ai = require('mini.ai')
        ai.setup({
                custom_textobjects = {
                        B = MiniExtra.gen_ai_spec.buffer(),
                        x = MiniExtra.gen_ai_spec.number(),
                        m = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
                        c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
                        l = ai.gen_spec.treesitter({ a = '@loop.outer', i = '@loop.inner' }),
                        ['?'] = ai.gen_spec.treesitter({ a = '@conditional.outer', i = '@conditional.inner' }),
                        P = ai.gen_spec.treesitter({ a = '@parameter.outer', i = '@parameter.inner' }),
                        R = ai.gen_spec.treesitter({ a = '@return.outer', i = '@return.inner' }),
                        k = ai.gen_spec.treesitter({ a = '@block.outer', i = '@block.inner' }),

                        ['/'] = ai.gen_spec.treesitter({
                                a = '@assignment.outer',
                                i = '@assignment.inner'
                        }),
                        ['='] = ai.gen_spec.treesitter({
                                a = '@assignment.lhs',
                                i = '@assignment.rhs'
                        }),
                },

                search_method = 'cover',
        })
end)
--}}}

--{{{completion
now_if_args(function()
        require('mini.completion').setup({
                lsp_completion = {
                        source_func = 'omnifunc',
                        auto_setup = false,
                        process_items = function(items, base)
                                return MiniCompletion.default_process_items(items, base, { kind_priority = { Text = -1, Snippet = 99 } })
                        end,
                },
        })

        Cfg.au('LspAttach', { callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
        end })

        vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
end)
later(function() require('mini.cmdline').setup() end)
later(function()
        require('mini.pairs').setup({ modes = { command = true } })
        -- fix: I use C-Bs all the time, by default only bs removes pair braces
        map('<C-w>', 'v:lua.MiniPairs.bs("\23")', 'i', { expr = true, replace_keycodes = false})
end)
--}}}

--{{{surround
later(function()
        require 'mini.surround'.setup({
                mappings    = {
                        add       = 'ya',
                        delete    = 'ds',
                        replace   = 'cs',

                        find      = 'yn',
                        find_left = 'yp',
                        highlight = 'yh'
                }
        })
end)
--}}}

--{{{operators
later(
        function()
                require 'mini.operators'.setup({
                        replace  = { prefix = 'r' },
                        multiply = { prefix = 'gl' },
                        exchange = { prefix = 'gt' }
                })

                map('(', 'gtiagtina', 'n', { remap = true })
                map(')', 'gtiagtila', 'n', { remap = true })
                -- function(aa, bb): stay on an 'a' and exchange
                end)
--}}}

--{{{git
later(function() require('mini.git').setup() end)
later(function() require('mini.diff').setup() end)
lncmap('gc', 'Git commit')
lncmap('gac', 'Git commit --amend')
lncmap('g<Leader>', 'Git push')
vim.keymap.set('n', '<leader>lg', function()
  vim.cmd('enew')
  vim.fn.termopen('lazygit', { on_exit = function() vim.cmd('bd!') vim.cmd('checktime') end })
  vim.cmd('startinsert')
end)
--}}}
