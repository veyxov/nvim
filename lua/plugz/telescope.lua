local M = {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },

    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" },
        { 'nvim-telescope/telescope-ui-select.nvim' }
    },
}

function M.config()
    local telescope = require("telescope")
    telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
            ["ui-select"] = {

            }
        },
        defaults = {
            borderchars = { "", "", "", "", "", "", "", "" }, -- No borders
            layout_strategy = "horizontal",
            layout_config = {
                prompt_position = "bottom",
            },
            sorting_strategy = "ascending",
            prompt_prefix = " ",
            selection_caret = " ",
            winblend = 0,
        },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
end

function M.init()
    vim.keymap.set('n', '<cr>s', "<cmd>Telescope find_files<cr>") -- Fuzzy find files ****
    vim.keymap.set('n', 'hh', "<cmd>Telescope help_tags<cr>") -- Seach in help
    vim.keymap.set('n', '<cr>g', "<cmd>Telescope live_grep<cr>") -- Grep search *
    vim.keymap.set('n', '<leader>/', "<cmd>Telescope current_buffer_fuzzy_find theme=get_dropdown previewer=false<cr>") -- Search in diagnostics
    vim.keymap.set('n', '<cr>r', "<cmd>Telescope lsp_references<cr>")
    vim.keymap.set('n', '<cr>d', "<cmd>Telescope diagnostics<cr>", { desc = '[S]earch [D]iagnostics' }) -- Search in diagnostics
end

return M
