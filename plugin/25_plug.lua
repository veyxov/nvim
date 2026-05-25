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

        local languages = {'c_sharp', 'sql', 'http'}
        local isnt_installed = function(lang)
                return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
        end
        local to_install = vim.tbl_filter(isnt_installed, languages)
        if #to_install > 0 then require('nvim-treesitter').install(to_install) end

        local filetypes = { 'cs', 'sql', 'markdown', 'go', 'http' }
        for _, lang in ipairs(languages) do
                for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
                        table.insert(filetypes, ft)
                end
        end

        Cfg.au('FileType', { pattern = filetypes, callback = function(ev) vim.treesitter.start(ev.buf) end })
end)

Cfg.on_event('TermOpen', function()
        vim.pack.add({ 'https://github.com/mikesmithgh/kitty-scrollback.nvim' })
        require('kitty-scrollback').setup()
end)

Cfg.later(function()
        vim.pack.add({ 'https://github.com/github/copilot.vim' })
end)
