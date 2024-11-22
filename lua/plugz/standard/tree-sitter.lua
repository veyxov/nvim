local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
            sync_install = false,
            highlight = {
                enable = true,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
        }
    end,

    dependencies = {
        {
            'nvim-treesitter/nvim-treesitter-context',
            config = function()
                require'treesitter-context'.setup{
                    multiline_threshold = 1, -- don't show every constructor parameter
                    mode = 'topline', -- too noisy when moving cursor
                }
            end
        }
    },
}
return M
