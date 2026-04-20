-- vim: foldmethod=marker foldlevel=0
local now, later, lnmap, map, cmap, lncmap, now_if_args = Cfg.now, Cfg.later, Cfg.lnmap, Cfg.map, Cfg.cmap, Cfg.lncmap, Cfg.now_if_args

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
lnmap('rr', '<Cmd>lua MiniSessions.restart()<CR>')
--}}}

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
lnmap('t', '<cmd>lua MiniPick.builtin.files()<cr>')
lnmap('g', '<cmd>lua MiniPick.builtin.grep_live()<cr>')
--}}}

--{{{jump2d
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

--{{{ui
later(function() require 'mini.icons'       .setup() end)
-- later(function() require('mini.tabline')    .setup() end)
later(function() require('mini.statusline') .setup() end)
later(function() require('mini.indentscope').setup() end)
later(function() require('mini.diff').setup() end)
--}}}


--{{{extra
later(function() require('mini.extra').setup() end)
later(function() require('mini.align').setup() end)

later(function()
        require('mini.bracketed').setup()
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
                        F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
                },

                -- 'mini.ai' by default mostly mimics built-in search behavior: first try
                -- to find textobject covering cursor, then try to find to the right.
                -- Although this works in most cases, some are confusing. It is more robust to
                -- always try to search only covering textobject and explicitly ask to search
                -- for next (`an`/`in`) or last (`al`/`il`).
                -- Try this. If you don't like it - delete next line and this comment.
                search_method = 'cover',
        })
end)
--}}}

--{{{completion
now_if_args(function()
        -- Customize post-processing of LSP responses for a better user experience.
        -- Don't show 'Text' suggestions (usually noisy) and show snippets last.
        local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
        local process_items = function(items, base)
                return MiniCompletion.default_process_items(items, base, process_items_opts)
        end
        require('mini.completion').setup({
                lsp_completion = {
                        -- Without this config autocompletion is set up through `:h 'completefunc'`.
                        -- Although not needed, setting up through `:h 'omnifunc'` is cleaner
                        -- (sets up only when needed) and makes it possible to use `<C-u>`.
                        source_func = 'omnifunc',
                        auto_setup = false,
                        process_items = process_items,
                },
        })

        -- Set 'omnifunc' for LSP completion only when needed.
        local on_attach = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
        end
        Cfg.new_autocmd('LspAttach', nil, on_attach)

        -- Advertise to servers that Neovim now supports certain set of completion and
        -- signature features through 'mini.completion'.
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

                map('(', 'gtiagtila', 'n', { remap = true })
                map(')', 'gtiagtina', 'n', { remap = true })
                -- function(aa, bb): stay on an 'a' and exchange
                end)
--}}}

later(function()
        require 'mini.visits'.setup()
end)
later(function()require 'mini.jump'.setup() end)

-- v is for 'Visits'. Common usage:
-- - `<Leader>vv` - add    "core" label to current file.
-- - `<Leader>vV` - remove "core" label to current file.
-- - `<Leader>vc` - pick among all files with "core" label.
local make_pick_core = function(cwd, desc)
  return function()
    local sort_latest = MiniVisits.gen_sort.default({ recency_weight = 1 })
    local local_opts = { cwd = cwd, filter = 'core', sort = sort_latest }
    MiniExtra.pickers.visit_paths(local_opts, { source = { name = desc } })
  end
end

lnmap('vc', make_pick_core('',  'Core visits (all)'))
lnmap('vC', make_pick_core(nil, 'Core visits (cwd)'))
lncmap('vv', 'lua MiniVisits.add_label("core")')
lncmap('vV', 'lua MiniVisits.remove_label("core")')
lncmap('vl', 'lua MiniVisits.add_label()')
lncmap('vL', 'lua MiniVisits.remove_label()')
