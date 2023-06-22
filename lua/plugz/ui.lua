-- Noice
local Noice = {
    'folke/noice.nvim',
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    keys = {
        {
            '<leader>ma',
            function()
                require('noice').cmd 'all'
            end,
        },
        {
            ':',
        },
    },
}

Noice.config = function()
    local opts = {
        lsp = {
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = true, -- temp?
        },
        background_color = '#FF0000',
        views = {
            cmdline_popup = {
                relative = 'editor',
                border = {
                    style = 'none',
                    padding = { 0, 0 },
                },
            },
            popupmenu = {
                relative = 'editor',
                border = {
                    style = 'none',
                    padding = { 0, 1 },
                },
            },
        },
    }

    require('noice').setup(opts)
end

-- Dressing
local function load_dressing()
    require('lazy').load { plugins = { 'dressing.nvim' } }
end

local Dressing = {
    'stevearc/dressing.nvim',
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
    require('dressing').setup {
        input = {
            default_prompt = '> ',
            border = 'single',
            prompt_align = 'center',
            relative = 'win',
        },
    }
end

return { Dressing, Noice }
