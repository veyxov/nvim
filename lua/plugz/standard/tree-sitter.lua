local function select(textobj)
    return function()
        require("nvim-treesitter-textobjects.select").select_textobject(textobj, "textobjects")
    end
end

local function move(textobj)
    return function()
        require("nvim-treesitter-textobjects.move").goto_next_start(textobj, "textobjects")
    end
end

local tree = {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local filetypes = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'c_sharp', 'json', 'http' }
        require('nvim-treesitter').install(filetypes)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetypes,
            callback = function() vim.treesitter.start() end,
        })
    end,
}

local objects = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
        -- Disable entire built-in ftplugin mappings to avoid conflicts.
        vim.g.no_plugin_maps = true
    end,
    config = function()
        local ts_repeat_move = require "nvim-treesitter-textobjects.repeatable_move"

        -- Repeat movement with ; and ,
        -- ensure ; goes forward and , goes backward regardless of the last direction
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, "|", ts_repeat_move.repeat_last_move_previous)
    end,
    keys = {
        { "a<CR>", select "@return.outer", mode = { "x", "o" }, desc = "↩ outer return" },
        { "i<CR>", select "@return.inner", mode = { "x", "o" }, desc = "↩ inner return" },
        { "aa", select "@parameter.outer", mode = { "x", "o" }, desc = "󰏪 outer arg" },
        { "ia", select "@parameter.inner", mode = { "x", "o" }, desc = "󰏪 inner arg" },
        { "iu", select "@loop.inner", mode = { "x", "o" }, desc = "󰛤 inner loop" },
        { "au", select "@loop.outer", mode = { "x", "o" }, desc = "󰛤 outer loop" },
        { "al", select "@call.outer", mode = { "x", "o" }, desc = "󰡱 outer call" },
        { "il", select "@call.inner", mode = { "x", "o" }, desc = "󰡱 inner call" },
        { "af", select "@function.outer", mode = { "x", "o" }, desc = " outer function" },
        { "if", select "@function.inner", mode = { "x", "o" }, desc = " inner function" },
        { "ao", select "@conditional.outer", mode = { "x", "o" }, desc = "󱕆 outer condition" },
        { "io", select "@conditional.inner", mode = { "x", "o" }, desc = "󱕆 inner condition" },

        { "<Left>f", move "@function.outer", mode = { "n", "x", "o" }, desc = "󰡱 next function" },
        { "<Left>F", move "@function.outer", mode = { "n", "x", "o" }, desc = "󰡱 prev function" },
        { "<Left>l", move "@loop.outer", mode = { "n", "x", "o" }, desc = "󰛤 next loop" },
        { "<Left>L", move "@loop.outer", mode = { "n", "x", "o" }, desc = "󰛤 prev loop" },
        { "<Left>o", move "@conditional.outer", mode = { "n", "x", "o" }, desc = "󱕆 next condition" },
    }
}

local context = {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    keys = {
        { '<Left>c', function() require 'treesitter-context'.go_to_context(vim.v.count1) end, desc = "goto context" },
        { '<Left>C', function() require 'treesitter-context'.toggle() end, desc = "toggle" },
    }
}

return { tree, objects, context }
