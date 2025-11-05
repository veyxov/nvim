return {
    "nvim-neotest/neotest",
    lazy = false,
    dependencies = {
        "nsidorenco/neotest-vstest",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-vstest")
            }
        })
    end
}
