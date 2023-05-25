-- Noice
local Noice = {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
    }
}

local Lualine = {
    "nvim-lualine/lualine.nvim",
    event = "InsertEnter",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end
}

Noice.keys = {
    {
        "<leader>ma",
        function() require 'noice'.cmd "all" end,
    },
}

Noice.config = function()
    local opts = {
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
        },
        background_color = '#FF0000',
        health = { checker = true, },
        views = {
            cmdline_popup = {
                relative = "editor",
                border = {
                    style = "none",
                    padding = { 1, 1 },
                },
                filter_options = {},
                win_options = {
                    winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 6,
                    col = "50%",
                },
                border = {
                    style = "none",
                    padding = { 0, 1 },
                },
            },
        },
    }

    require 'noice'.setup(opts)
end

-- Dressing
local function load_dressing()
    require 'lazy'.load { plugins = { "dressing.nvim" } }
end

local Dressing = {
    "stevearc/dressing.nvim"
}

-- Load the module when needed
Dressing.init = function()
    vim.ui.select = function(...)
        load_dressing()
        return vim.ui.select(...)
    end
    vim.ui.input = function(...)
        load_dressing()
        return vim.ui.input(...)
    end
end

Dressing.config = function()
    require 'dressing'.setup {
        input = {
            default_prompt = "> ",
            border = 'single',
            prompt_align = 'center',
            relative = "win"
        }
    }
end

return { Dressing, Noice, Lualine }
