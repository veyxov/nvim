Cfg.later(function()
        vim.pack.add({ 'https://github.com/pwntester/octo.nvim' })

        require 'octo'.setup({
                enable_builtin = true,
                default_merge_method = "squash",
                picker = "default",
        })
end)
