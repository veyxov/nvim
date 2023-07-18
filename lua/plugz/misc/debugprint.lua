local M = {
    'andrewferrier/debugprint.nvim',
    lazy = false,
    config = function()
        local opts = {
            create_keymaps = false,
            cerate_commands = false,
        }

        require('debugprint').setup(opts)
        vim.keymap.set('n', '<Leader>D', function()
            -- Note: setting `expr=true` and returning the value are essential
            return require('debugprint').debugprint { above = true }
        end, {
            expr = true,
        })
    end,
}

M.keys = {
    {
        'n',
        '<Leader>d',
        function()
            -- Note: setting `expr=true` and returning the value are essential
            return require('debugprint').debugprint()
        end,
        {
            expr = true,
        },
    },
}

return M
