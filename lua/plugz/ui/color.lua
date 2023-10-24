return {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    event = 'VeryLazy',
    config = function() vim.cmd.colorscheme 'onedark' end,
}
