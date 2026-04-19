local add = vim.pack.add
local now_if_args, on_filetype, later = Cfg.now_if_args, Cfg.on_filetype, Cfg.later

-- Tree-sitter ================================================================

-- Tree-sitter is a tool for fast incremental parsing. It converts text into
-- a hierarchical structure (called tree) that can be used to implement advanced
-- and/or more precise actions: syntax highlighting, textobjects, indent, etc.
--
-- Tree-sitter support is built into Neovim (see `:h treesitter`). However, it
-- requires two extra pieces that don't come with Neovim directly:
-- - Language parsers: programs that convert text into trees. Some are built-in
--   (like for Lua), 'nvim-treesitter' provides many others.
--   NOTE: It requires third party software to build and install parsers.
--   See the link for more info in "Requirements" section of the MiniMax README.
-- - Query files: definitions of how to extract information from trees in
--   a useful manner (see `:h treesitter-query`). 'nvim-treesitter' also provides
--   these, while 'nvim-treesitter-textobjects' provides the ones for Neovim
--   textobjects (see `:h text-objects`, `:h MiniAi.gen_spec.treesitter()`).
--
-- Add these plugins now if file (and not 'mini.starter') is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.treesitter nvim-treesitter` to see potential issues.
-- - In case of errors related to queries for Neovim bundled parsers (like `lua`,
--   `vimdoc`, `markdown`, etc.), manually install them via 'nvim-treesitter'
--   with `:TSInstall <language>`. Be sure to have necessary system dependencies
--   (see MiniMax README section for software requirements).
now_if_args(function()
        -- Define hook to update tree-sitter parsers after plugin is updated
        local ts_update = function() vim.cmd('TSUpdate') end
        Cfg.on_packchanged('nvim-treesitter', { 'update' }, ts_update, ':TSUpdate')

        add({
                'https://github.com/nvim-treesitter/nvim-treesitter',
                'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
        })

        -- Define languages which will have parsers installed and auto enabled
        -- After changing this, restart Neovim once to install necessary parsers. Wait
        -- for the installation to finish before opening a file for added language(s).
        local languages = {
                -- These are already pre-installed with Neovim. Used as an example.
                'lua',
                'vimdoc',
                'markdown',
                -- Add here more languages with which you want to use tree-sitter
                -- To see available languages:
                -- - Execute `:=require('nvim-treesitter').get_available()`
                -- - Visit 'SUPPORTED_LANGUAGES.md' file at
                --   https://github.com/nvim-treesitter/nvim-treesitter/blob/main
        }
        local isnt_installed = function(lang)
                return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
        end
        local to_install = vim.tbl_filter(isnt_installed, languages)
        if #to_install > 0 then require('nvim-treesitter').install(to_install) end

        -- Enable tree-sitter after opening a file for a target language
        local filetypes = {}
        for _, lang in ipairs(languages) do
                for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
                        table.insert(filetypes, ft)
                end
        end
        local ts_start = function(ev) vim.treesitter.start(ev.buf) end
        Cfg.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
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

        -- Use `:h vim.lsp.enable()` to automatically enable language server based on
        -- the rules provided by 'nvim-lspconfig'.
        -- Use `:h vim.lsp.config()` or 'after/lsp/' directory to configure servers.
        -- Uncomment and tweak the following `vim.lsp.enable()` call to enable servers.
        -- vim.lsp.enable({
                --   -- For example, if `lua-language-server` is installed, use `'lua_ls'` entry
                -- })
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
