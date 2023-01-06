local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "json", "c_sharp" },
        highlight = { enable = true },
        indent = { enable = false },


        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",

                    ["ic"] = "@class.inner",
                    ["ac"] = "@class.outer",

                    ["ib"] = "@block.inner",
                    ["ab"] = "@block.outer",

                    ["ic"] = "@call.inner",
                    ["ac"] = "@call.outer",
                },

                include_surrounding_whitespace = true,
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["gm"] = "@function.outer",
                },
                goto_next_end = {
                    ["gM"] = "@function.outer",
                },
                goto_previous_start = {
                    ["Gm"] = "@function.outer",
                },
                goto_previous_end = {
                    ["GM"] = "@function.outer",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>gm"] = "@function.outer",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
        },
    })
end

return M

