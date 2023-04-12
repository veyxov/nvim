local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "InsertEnter",
}

M.dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "json", "c_sharp" },
        -- highlight
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" }
        },
        indent = { enable = false },
        textobjects = {
            select = {
                enable = true,
                -- Automatically jump forward to textobj
                lookahead = true,
                keymaps = {
                    ["am"] = "@function.outer",
                    ["im"] = "@function.inner",
                    ["aC"] = "@class.outer",
                    ["iC"] = "@class.inner",
                    ["aif"] = "@conditional.outer",
                    ["iif"] = "@conditional.inner",
                    ["ib"] = "@block.inner",
                    ["ab"] = "@block.outer",
                    ["il"] = "@loop.inner",
                    ["al"] = "@loop.outer",
                    ["ic"] = "@call.inner",
                    ["ac"] = "@call.outer",
                    ["aa"] = "@parameter.inner",
                },
                include_surrounding_whitespace = false,
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["["] = "@function.outer",
                    ["gb"] = "@block.inner"
                },
                goto_next_end = {
                    ["gM"] = "@function.outer",
                },
                goto_previous_start = {
                    ["]"] = "@function.outer",
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
