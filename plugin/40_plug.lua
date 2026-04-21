local add = vim.pack.add
local now_if_args, on_filetype, later = Cfg.now_if_args, Cfg.on_filetype, Cfg.later

now_if_args(function()
        Cfg.au('PackChanged', { callback = function(ev)
                if ev.data.spec.name ~= 'nvim-treesitter' or ev.data.kind ~= 'update' then return end
                if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
                vim.cmd 'TSUpdate'
        end })

        add({'https://github.com/nvim-treesitter/nvim-treesitter'})
        add({'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'})

        local languages = {'c_sharp', 'sql'}
        local isnt_installed = function(lang)
                return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
        end
        local to_install = vim.tbl_filter(isnt_installed, languages)
        if #to_install > 0 then require('nvim-treesitter').install(to_install) end

        local filetypes = { 'cs', 'sql', 'markdown' }
        for _, lang in ipairs(languages) do
                for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
                        table.insert(filetypes, ft)
                end
        end

        Cfg.au('FileType', { pattern = filetypes, callback = function(ev) vim.treesitter.start(ev.buf) end })
end)

on_filetype('cs', function()
        vim.pack.add({ 'https://github.com/GustavEikaas/easy-dotnet.nvim' })

        local dotnet = require 'easy-dotnet'
        dotnet.setup({
                fsproj_mappings = false,
                picker = "basic",
                background_scanning = true,
                notifications = {
                        handler = false
                }
        })
        -- FIX: don't override sql injections with comment sematic tokens
        vim.api.nvim_set_hl(0, '@lsp.type.string.cs', {})
end)

Cfg.on_event('TermOpen', function()
        vim.pack.add({ 'https://github.com/mikesmithgh/kitty-scrollback.nvim' })
        require('kitty-scrollback').setup()
end)
