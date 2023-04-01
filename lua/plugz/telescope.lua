local M = {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            [[cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build
            build --config Release && cmake --install build --prefix build]]
        },
        { 'nvim-telescope/telescope-file-browser.nvim' }
    },
}

function M.config()
    local telescope = require("telescope")
    local fb_actions = require "telescope".extensions.file_browser.actions
    telescope.setup({
        extensions = {
            undo = {
                use_delta = true,
                -- Big side by side view
                side_by_side = true,
                layout_strategy = "vertical",
                layout_config = {
                    preview_height = 0.8,
                },
            },
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            },
            file_browser = {
                theme = "ivy",
                hijack_netrw = true,
                mappings = {
                    ["i"] = {
                        -- remap to going to home directory
                        ["<C-n>"] = fb_actions.create_from_prompt,
                        ["<C-r>"] = fb_actions.rename,
                    },
                }
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
    telescope.load_extension("file_browser")
end

function M.init()
    vim.keymap.set('n', '<cr>s', "<cmd>Telescope find_files<cr>") -- Fuzzy find files ****
    vim.keymap.set('n', 'hh', "<cmd>Telescope help_tags<cr>")     -- Seach in help
    vim.keymap.set('n', '<cr>g', "<cmd>Telescope live_grep<cr>")  -- Grep search *

    vim.keymap.set('n', '<leader>/', [[
        <cmd>
            Telescope
            current_buffer_fuzzy_find
            theme=get_dropdown
            previewer=false
        <cr>
    ]]) -- Search in diagnostics

    vim.keymap.set('n', '<cr>r', "<cmd>Telescope lsp_references<cr>")
    vim.keymap.set('n', '<cr>o', "<cmd>Telescope lsp_workspace_symbols<cr>")

    vim.keymap.set("n", "<cr>n",
        function()
            require 'telescope'
                .extensions
                .file_browser
                .file_browser({ depth = 5, files = false })
        end)

    vim.keymap.set("n", "<cr>N",
        function()
            require 'telescope'
                .extensions
                .file_browser
                .file_browser({ depth = 3 })
        end)
end

return M
