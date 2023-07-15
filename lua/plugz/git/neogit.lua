local M = {
    'NeogitOrg/neogit',
    dependencies = 'nvim-lua/plenary.nvim',
    lazy = false,
}

M.config = function()
    local neogit = require("neogit")

    neogit.setup {
        disable_signs = false, -- TODO: What is this?
        disable_hint = false, -- TODO: What is this?
        disable_context_highlighting = false, -- TODO: What is this?
        disable_commit_confirmation = true,
        disable_builtin_notifications = false, -- TODO: Might be handy
        -- If enabled, use telescope for menu selection rather than vim.ui.select.
        -- Allows multi-select and some things that vim.ui.select doesn't.
        use_telescope = false, -- TODO: Maybe? But I'm using dressing.nvim
        -- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example
        -- below will use the native fzf sorter instead.
        telescope_sorter = function()
            return require("telescope").extensions.fzf.native_fzf_sorter()
        end,
        -- Change the default way of opening neogit
        kind = "tab",
        -- The time after which an output console is shown for slow running commands
        console_timeout = 2000,
        -- Automatically show console if a command takes more than console_timeout milliseconds
        auto_show_console = true,
        -- Persist the values of switches/options within and across sessions
        remember_settings = true,
        -- Scope persisted settings on a per-project basis
        use_per_project_settings = true,
        -- Change the default way of opening the commit popup
        commit_popup = {
            kind = "split",
        },
        -- Change the default way of opening the preview buffer
        preview_buffer = {
            kind = "split",
        },
        -- Change the default way of opening popups
        popup = {
            kind = "split",
        },
        -- customize displayed signs
        signs = {
            -- { CLOSED, OPENED }
            section = { ">", "v" },
            item = { ">", "v" },
            hunk = { "", "" },
        },
        integrations = {
            diffview = true,
        },
        -- Setting any section to `false` will make the section not render at all
        -- override/add mappings
        mappings = {
            -- modify status buffer mappings
            status = {
                -- Adds a mapping with "B" as key that does the "BranchPopup" command
                ["B"] = "BranchPopup",
                -- Removes the default mapping of "s"
                ["u"] = "",
            },
            -- Modify fuzzy-finder buffer mappings
            finder = {
                -- Binds <cr> to trigger select action
                ["<cr>"] = "select",
            }
        }
    }
end

return M
