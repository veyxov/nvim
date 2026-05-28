local add = vim.pack.add
local now_if_args = Cfg.now_if_args

now_if_args(function()
        Cfg.au('PackChanged', { callback = function(ev)
                if ev.data.spec.name ~= 'nvim-treesitter' or ev.data.kind ~= 'update' then return end
                if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
                vim.cmd 'TSUpdate'
        end })

        add({'https://github.com/nvim-treesitter/nvim-treesitter'})
        add({'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'})

        local languages = {
                'c_sharp', 'sql', 'http', 'go',
                'lua', 'markdown', 'markdown_inline',
                'json', 'jsonc', 'yaml', 'toml',
                'vim', 'vimdoc', 'bash',
                'regex', 'diff', 'gitcommit',
        }
        local isnt_installed = function(lang)
                return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
        end
        local to_install = vim.tbl_filter(isnt_installed, languages)
        if #to_install > 0 then require('nvim-treesitter').install(to_install) end

        local filetypes = {
                'cs', 'sql', 'markdown', 'go', 'http',
                'lua', 'json', 'jsonc', 'yaml', 'toml',
                'vim', 'help', 'sh', 'bash', 'zsh',
                'gitcommit', 'diff',
        }
        for _, lang in ipairs(languages) do
                for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
                        table.insert(filetypes, ft)
                end
        end

        Cfg.au('FileType', { pattern = filetypes, callback = function(ev) vim.treesitter.start(ev.buf) end })

        require('nvim-treesitter-textobjects').setup({
                select = { lookahead = true },
                move = { set_jumps = true },
        })
        local move = require('nvim-treesitter-textobjects.move')
        local rm   = require('nvim-treesitter-textobjects.repeatable_move')
        local pair = function(cap)
                return rm.make_repeatable_move_pair(
                        function() move.goto_next_start(cap, 'textobjects') end,
                        function() move.goto_previous_start(cap, 'textobjects') end
                )
        end
        local nf, pf = pair('@function.outer')
        local na, pa = pair('@parameter.outer')
        local nk, pk = pair('@class.outer')
        local m = { 'n', 'x', 'o' }
        Cfg.map(']m', nf, m); Cfg.map('[m', pf, m)
        Cfg.map(']a', na, m); Cfg.map('[a', pa, m)
        Cfg.map(']k', nk, m); Cfg.map('[k', pk, m)
        Cfg.map(';',  rm.repeat_last_move,          m)
        Cfg.map(',',  rm.repeat_last_move_opposite, m)
end)

Cfg.on_event('TermOpen', function()
        vim.pack.add({ 'https://github.com/mikesmithgh/kitty-scrollback.nvim' })
        require('kitty-scrollback').setup()
end)

Cfg.later(function()
        vim.pack.add({ 'https://github.com/github/copilot.vim' })
        vim.g.copilot_no_tab_map = true
        vim.keymap.set('i', '<Right>', 'copilot#Accept("\\<Right>")', {
                expr = true, replace_keycodes = false, silent = true,
        })
end)
