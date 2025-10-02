return {
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
        "nsidorenco/neotest-vstest",
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        {
            "rachartier/tiny-inline-diagnostic.nvim",
            event = "VeryLazy", -- Or `LspAttach`
            priority = 1000, -- needs to be loaded in first
            config = function()
                require('tiny-inline-diagnostic').setup()
                vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
            end
        }
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-vstest")
            }
        })
    end
}
