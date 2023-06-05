local map = require 'globals'.Map

local LazyGit = {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    init = function()
        map('<leader>gg', '<cmd>LazyGit<cr>')
    end
}

local Gitsigns = {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
        local gs = require 'gitsigns'
        gs.setup { yadm = { enable = true } }

        -- Hunk stage
        map('hs', gs.stage_hunk)
        map('hr', gs.reset_hunk)

        map('hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, 'v')
        map('hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, 'v')

        --map('ha', gs.stage_buffer)
        map('hU', gs.stage_buffer)

        map('hb', function() gs.blame_line{full=true} end)
    end
}

local Neogit = {
    "TimUntersberger/neogit",
    cmd = 'Neogit',
    keys = {
        {"<leader>g", '<cmd>Neogit<cr>'}
    },
    config = function()
        local neogit = require('neogit')
        neogit.setup {
            disable_commit_confirmation = true,
            disable_builtin_notifications = false,
            kind = "tab",
            console_timeout = 10000,
            auto_show_console = true,
            remember_settings = true,
            use_per_project_settings = true,
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
                diffview = true
            },
            -- Setting any section to `false` will make the section not render at all
            sections = {
                untracked = {
                    folded = false
                },
                unstaged = {
                    folded = false
                },
                staged = {
                    folded = false
                },
                stashes = {
                    folded = true
                },
                unpulled = {
                    folded = true
                },
                unmerged = {
                    folded = false
                },
                recent = {
                    folded = true
                },
            },
            -- override/add mappings
            mappings = {
                -- modify status buffer mappings
                status = {
                    -- Adds a mapping with "B" as key that does the "BranchPopup" command
                    ["B"] = "BranchPopup",
                    ["u"] = "",
                }
            }
        }
    end
}

local Fugitive = {
    "tpope/vim-fugitive",
    cmd = 'G',
    init = function()
        map('gac', '<cmd>G add . | G commit<cr>')
        --map('gc', '<cmd>G commit<cr>')
        --map('gb', '<cmd>G blame<cr>')

        --map('gP', '<cmd>G! push<cr>')
        --map('ga', '<cmd>G add .<cr>') -- stage all files

    end
}

local Search =     {
    "aaronhallaert/advanced-git-search.nvim",
    keys = {
        {"<leader>gs", "<cmd>AdvancedGitSearch<cr>"}
    },
    config = function()
        require 'telescope'.load_extension("advanced_git_search")
    end,
    dependencies = {
        "tpope/vim-rhubarb",
        "sindrets/diffview.nvim",
    },
}

return {
    Gitsigns,
    Fugitive,
    --Neogit,
    Search,
    LazyGit
}
