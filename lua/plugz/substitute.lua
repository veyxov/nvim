return {
    'gbprod/substitute.nvim',
    keys = {
        { 'r', function() require('substitute').operator() end },
        { 'r', function() require('substitute').visual() end, mode = 'x' },
        {
            '<leader>r',
            function() require('substitute.range').operator() end,
        },
        {
            '<leader>r',
            function() require('substitute.range').visual() end,
            mode = 'x',
        },

        {
            '<leader>x',
            function() require('substitute.exchange').operator() end,
        },
        {
            'x',
            function() require('substitute.exchange').visual() end,
            mode = 'x',
        },
    },
    config = function()
        local on_substitute
        local ok, glimmer = pcall(require, "tiny-glimmer.support.substitute")
        if ok then on_substitute = glimmer.substitute_cb end

        require("substitute").setup({
            on_substitute = on_substitute,
            highlight_substituted_text = { enabled = false },
        })
    end,
}
