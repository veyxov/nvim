local add = vim.pack.add
local now_if_args, on_filetype, later = Cfg.now_if_args, Cfg.on_filetype, Cfg.later

now_if_args(function()
        Cfg.on_packchanged('nvim-treesitter', { 'update' }, function() vim.cmd('TSUpdate') end, ':TSUpdate')

        add({
                'https://github.com/nvim-treesitter/nvim-treesitter',
                'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
        })

        local languages = {'c_sharp'}
        local isnt_installed = function(lang)
                return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
        end
        local to_install = vim.tbl_filter(isnt_installed, languages)
        if #to_install > 0 then require('nvim-treesitter').install(to_install) end

        local filetypes = { 'cs', 'markdown' }
        for _, lang in ipairs(languages) do
                for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
                        table.insert(filetypes, ft)
                end
        end

        Cfg.new_autocmd('FileType', filetypes, function(ev) vim.treesitter.start(ev.buf) end, 'Start tree-sitter')
end)

-- Language servers ===========================================================

-- Language Server Protocol (LSP) is a set of conventions that power creation of
-- language specific tools. It requires two parts:
-- - Server - program that performs language specific computations.
-- - Client - program that asks server for computations and shows results.
--
-- Here Neovim itself is a client (see `:h vim.lsp`). Language servers need to
-- be installed separately based on your OS, CLI tools, and preferences.
-- See note about 'mason.nvim' at the bottom of the file.
--
-- Neovim's team collects commonly used configurations for most language servers
-- inside 'neovim/nvim-lspconfig' plugin.
--
-- Add it now if file (and not 'mini.starter') is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.lsp` to see potential issues.
now_if_args(function()
        add({ 'https://github.com/neovim/nvim-lspconfig' })
end)

on_filetype('cs', function()
        vim.pack.add({ 'https://github.com/GustavEikaas/easy-dotnet.nvim' })

        local dotnet = require 'easy-dotnet'
        dotnet.setup({
                lsp = {
                        set_fold_expr = true,
                },
                fsproj_mappings = false,
                -- choose which picker to use with the plugin
                -- possible values are "telescope" | "fzf" | "snacks" | "basic"
                -- if no picker is specified, the plugin will determine
                -- the available one automatically with this priority:
                --  snacks -> fzf -> telescope ->  basic
                picker = "basic",
                background_scanning = true,
                notifications = {
                        handler = false
                }
        })
end)
