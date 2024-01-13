return {
    lazy = false,
    "https://github.com/atusy/treemonkey.nvim",
    init = function()
        vim.keymap.set({ "x", "o" }, "m", function()
            require("treemonkey").select({ ignore_injections = false })
        end)
    end
}
