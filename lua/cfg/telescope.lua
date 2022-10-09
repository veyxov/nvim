require "telescope".setup {
    defaults = {
        selection_caret = '\t',
        entry_prefix = '',
        prompt_prefix = '❯ ',
        border = false,
        preview = {
            timeout = 10,
            filesize_limit = 1,
            treesitter = false,
        },
        layout_config = {
            horizontal = {
                height = 0.99,
                preview_cutoff = 100,
                prompt_position = "bottom",
                width = 0.99
            }
        },
        layout_strategy = 'horizontal'
    },
    extensions = {
        fzf = {
            case_mode = "smart_case",
        }
    }
}
