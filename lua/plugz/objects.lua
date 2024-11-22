return {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = "VeryLazy",
    dependencies = {
        'nvim-treesitter/nvim-treesitter'
    },
    config = function()
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
            },
        }
    end
}
