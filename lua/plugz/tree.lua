local M = {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x"
}

M.dependencies = {
    "MunifTanjim/nui.nvim",
}

M.keys = {
    { '<C-n>',   '<cmd>Neotree toggle<cr>' },
    { '<C-S-n>', '<cmd>Neotree reveal_file=%:p<cr>' }
}

M.init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
end

M.config = function()
    require 'neo-tree'.setup {
        auto_clean_after_session_restore = true,
        source_selector = {
            winbar = true,
            statusline = true
        },
        close_if_last_window = true,
        enable_git_status = false,
        enable_diagnostic = false,
        use_libuv_file_watcher = true,
        follow_current_file = true,
        window = {
            position = "left",
            width = 40,
            mapping_options = {
                noremap = true,
                nowait = true,
            },
            mappings = {
                ["I"] = "navigate_up", -- cd ..
                ["."] = "set_root",    -- Set root to current node
                ["H"] = "toggle_hidden",
                ["<space>"] = {
                    "toggle_node",
                    nowait = false,
                },
                ["<cr>"] = "open",
                ["<esc>"] = "revert_preview",
                ["P"] = { "toggle_preview", config = { use_float = true } },
                ["l"] = "focus_preview",
                ["S"] = "open_split",
                ["s"] = "open_vsplit",
                -- ["S"] = "split_with_window_picker",
                -- ["s"] = "vsplit_with_window_picker",
                ["t"] = "open_tabnew",
                -- ["<cr>"] = "open_drop",
                -- ["t"] = "open_tab_drop",
                ["w"] = "open_with_window_picker",
                --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
                ["C"] = "close_node",
                -- ['C'] = 'close_all_subnodes',
                ["z"] = "close_all_nodes",
                --["Z"] = "expand_all_nodes",
                ["a"] = {
                    "add",
                    -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
                    -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                    config = {
                        show_path = "none" -- "none", "relative", "absolute"
                    }
                },
                ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
                ["d"] = "delete",
                ["r"] = "rename",
                ["y"] = "copy_to_clipboard",
                ["x"] = "cut_to_clipboard",
                ["p"] = "paste_from_clipboard",
                ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
                ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
                ["q"] = "close_window",
                ["R"] = "refresh",
                ["<"] = "prev_source",
                [">"] = "next_source",
            }
        },
    }
end

return M
