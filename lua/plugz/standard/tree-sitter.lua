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
        local filetypes = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'c_sharp', 'json' }
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
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

        -- vim way: ; goes to the direction you were moving.
        -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

        -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
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

        { "kf", move "@function.outer", mode = { "n", "x", "o" }, desc = "󰡱 next function" },
        { "kF", move "@function.outer", mode = { "n", "x", "o" }, desc = "󰡱 prev function" },
        { "kl", move "@loop.outer", mode = { "n", "x", "o" }, desc = "󰛤 next loop" },
        { "kL", move "@loop.outer", mode = { "n", "x", "o" }, desc = "󰛤 prev loop" },
        { "ko", move "@conditional.outer", mode = { "n", "x", "o" }, desc = "󱕆 next condition" },
    }
}

local context = {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    keys = {
        { 'kc', function() require 'treesitter-context'.go_to_context(vim.v.count1) end, desc = "goto context" },
    }
}

return { tree, objects, context }
