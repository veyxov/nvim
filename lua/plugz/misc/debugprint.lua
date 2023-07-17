return {
    "andrewferrier/debugprint.nvim",
    config = function()
        local opts = {
            create_keymaps = false,
            cerate_commands = false
        }

        require("debugprint").setup(opts)
    end
}
