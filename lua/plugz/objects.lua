return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = "VeryLazy",
    dependencies = {
        'nvim-treesitter/nvim-treesitter'
    },
    config = function()
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
        require'nvim-treesitter.configs'.setup {
            textobjects = {
                select = {
                    enable = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["aa"] = "@parameter.inner",
                        ["ia"] = "@parameter.inner",
                        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>xa"] = "@parameter.inner",
                        ["<leader>xf"] = "@function.outer",
                        ["<leader>xc"] = "@call.outer",
                    },
                    swap_previous = {
                        ["<leader>xA"] = "@parameter.inner",
                        ["<leader>xF"] = "@function.outer",
                    },
                },

                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["gl"] = "@function.outer",
                    },
                    goto_next_end = {
                        ["gL"] = "@function.outer",
                    },
                    goto_next = {
                        ["]d"] = "@conditional.outer",
                    },
                    goto_previous = {
                        ["[d"] = "@conditional.outer",
                    },
                },
            },
        }
    end
}
