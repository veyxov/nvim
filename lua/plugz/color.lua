local Moonlify = {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    event = 'VeryLazy',
    config = function()
        vim.cmd.colorscheme 'moonfly'
    end
}

local Gruvbox = {
    "ellisonleao/gruvbox.nvim",
    event = 'VeryLazy',
    config = function()
        vim.cmd.colorscheme 'gruvbox'
    end,
}

return Moonlify;
