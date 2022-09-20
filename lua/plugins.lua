local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    -- lsp
    use {{
        'williamboman/mason-lspconfig.nvim', -- Load on LspStart command (1.1)
        cmd = "LspStart"
    },{
        "williamboman/mason.nvim",
        after = "mason-lspconfig.nvim" -- Load after mason-lspconfig (1.2)
    },{
        'neovim/nvim-lspconfig', -- Load after mason.nvim (1.3)
        config = kfg 'lsp',
        after = "mason.nvim"
    },{
        'glepnir/lspsaga.nvim', -- Load on LspSaga command (2)
        config = kfg 'lspsaga',
        cmd  = "Lspsaga"
    }}

    -- Snippets
    use {
        'L3MON4D3/LuaSnip',
        config = kfg 'luasnip',
        event = "InsertEnter"
    }

    use {
        -- Completion and sources
        { 'hrsh7th/nvim-cmp', config = kfg 'cmp', after = "nvim-lspconfig" }, -- Run after 1.3 (3.1)
        { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" }, -- Run all the providers after
        { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" },
        { 'hrsh7th/cmp-buffer', after = "nvim-cmp" },
        { 'hrsh7th/cmp-path', after = "nvim-cmp" },
        { 'hrsh7th/cmp-cmdline', after = "nvim-cmp" },
    }

    -- Tree-sitter
    -- use 'nvim-treesitter/playground'
    use {
        'nvim-treesitter/nvim-treesitter',
        config = kfg 'treesitter',
        run = ":TSUpdate",
        event = "InsertEnter"
    }

    -- Treesitter-textobjects
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        config = kfg 'treesitter-textobjects',
        after = "nvim-treesitter"
    }

    -- Gruvbox
    use {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("gruvbox").setup({
                inverse = true,
                invert_selection = false,
                contrast = "hard",
            })
            vim.cmd("color gruvbox")
        end,
        event = "InsertEnter"
    }

    -- Lightspeed
    use {
        'ggandor/lightspeed.nvim',
        keys = { 's', 'S', 'f', 'F' },
        config = kfg 'speed'
    }

    -- Hydra
    use {{
        'anuvyklack/keymap-layer.nvim',
    },{
        'anuvyklack/hydra.nvim',
        config = kfg 'hydra'
    }}

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = kfg 'telescope',
        cmd = "Telescope"
    }

    -- File tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        config = kfg 'tree',
        branch = "v2.x",
        requires = {
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree"
    }

    -- Html
    use {
        'windwp/nvim-ts-autotag',
        config = function ()
            require('nvim-ts-autotag').setup()
        end,
        ft = {"html", "xml"}
    }

    -- Surround
    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({
                keymaps = {
                    insert_line = "<C-g>S",
                    normal = "ks",
                    normal_cur = "kss",
                    normal_line = "kS",
                    normal_cur_line = "ySS",
                    visual = "K",
                    visual_line = "gS",
                    delete = "ds",
                    change = "cs",
                },
            })
        end,
        event = "InsertEnter"
    }
end,
    config = { git = { clone_timeout = nil } }
})
