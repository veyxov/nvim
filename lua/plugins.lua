local kfg = function(name) return string.format('require("cfg/%s")', name) end

require 'packer'.startup({ function(use)
    -- Global dependencies
    use {
        'wbthomason/packer.nvim',
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    -- lsp
    use { {
        'williamboman/mason-lspconfig.nvim', -- Load on LspStart command (1.1)
        cmd = "LspStart"
    }, {
        "williamboman/mason.nvim",
        after = "mason-lspconfig.nvim" -- Load after mason-lspconfig (1.2)
    }, {
        'neovim/nvim-lspconfig', -- Load after mason.nvim (1.3)
        config = kfg 'lsp',
        after = "mason.nvim"
    }, {
        'glepnir/lspsaga.nvim', -- Load on LspSaga command (2)
        config = kfg 'lspsaga',
        cmd    = "Lspsaga"
    } }

    -- Snippets
    use {
        'L3MON4D3/LuaSnip',
        config = kfg 'luasnip',
        event = "InsertEnter"
    }

    use {
        'ZhiyuanLck/smart-pairs',
        event = 'InsertEnter',
        config = function()
            require('pairs'):setup()
        end
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
        end,
        event = "InsertEnter"
    }

    use { 'nagy135/typebreak.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            vim.keymap.set('n', '<leader>tb', require('typebreak').start, { desc = "Typebreak" })
        end
    }

    use {
        'bluz71/vim-moonfly-colors',
        event = "InsertEnter"
    }

    use {
        "arnamak/stay-centered.nvim",
        config = function()
            require("stay-centered")
        end
    }
    use {
        "sainnhe/everforest",
        config = function()
            vim.g.everforest_background = 'hard'
            vim.cmd('color everforest')
        end
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                toggler = {
                    line = 'gcc',
                    block = 'gbc',
                },
                opleader = {
                    line = 'gc',
                    block = 'gb',
                },
                extra = {
                    above = 'gcO',
                    below = 'gco',
                    eol = 'gA',
                },
                mappings = {
                    basic = true,
                    extra = true,
                    extended = false,
                },
                pre_hook = nil,
                post_hook = nil,
            }
        end
    }

    use {
        'ggandor/leap.nvim',
        config = function()
            local leap = require 'leap'
            leap.add_default_mappings()
            leap.opts.safe_labels = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }
            leap.opts.labels = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }
        end
    }

    use {
        'ggandor/leap-spooky.nvim',
        config = function()
            require('leap-spooky').setup {
                affixes = {
                    -- These will generate mappings for all native text objects, like:
                    -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
                    -- Special line objects will also be added, by repeating the affixes.
                    -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
                    -- window.
                    -- You can also use 'rest' & 'move' as mnemonics.
                    remote   = { window = 'r', cross_window = 'R' },
                    magnetic = { window = 'm', cross_window = 'M' },
                },
                -- If this option is set to true, the yanked text will automatically be pasted
                -- at the cursor position if the unnamed register is in use.
                paste_on_remote_yank = false,
            }
        end
    }

    use {
        'ggandor/flit.nvim',
        config = function()
            require('flit').setup {
                labeled_modes = "nvo",
                opts = {
                    safe_labels = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' },
                    labels = { 'n', 'e', 'i', 'o', 's', 'a', 'r', 't' }
                }
            }
        end
    }

    -- Hydra
    use { {
        'anuvyklack/keymap-layer.nvim',
    }, {
        'anuvyklack/hydra.nvim',
        config = kfg 'hydra'
    } }

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

    use {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            vim.diagnostic.config({
                virtual_text = false,
            })
            require("lsp_lines").setup()
        end,
        after = "nvim-lspconfig"
    }

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    use {
        "nvim-pack/nvim-spectre",
        config = function()
            require('spectre').setup({
                open_cmd = 'vnew',
                live_update = true, -- auto excute search again when you write any file in vim
                highlight = {
                    ui = "String",
                    search = "DiffChange",
                    replace = "DiffDelete"
                },
                mapping={
                    ['toggle_line'] = {
                        map = "dd",
                        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
                        desc = "toggle current item"
                    },
                    ['enter_file'] = {
                        map = "<cr>",
                        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
                        desc = "goto current file"
                    },
                    ['send_to_qf'] = {
                        map = "<leader>q",
                        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                        desc = "send all item to quickfix"
                    },
                    ['replace_cmd'] = {
                        map = "<leader>c",
                        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
                        desc = "input replace vim command"
                    },
                    ['show_option_menu'] = {
                        map = "<leader>o",
                        cmd = "<cmd>lua require('spectre').show_options()<CR>",
                        desc = "show option"
                    },
                    ['run_current_replace'] = {
                        map = "<leader>rc",
                        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
                        desc = "replace current line"
                    },
                    ['run_replace'] = {
                        map = "<leader>R",
                        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                        desc = "replace all"
                    },
                    ['change_view_mode'] = {
                        map = "<leader>v",
                        cmd = "<cmd>lua require('spectre').change_view()<CR>",
                        desc = "change result view mode"
                    },
                    ['change_replace_sed'] = {
                        map = "trs",
                        cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
                        desc = "use sed to replace"
                    },
                    ['change_replace_oxi'] = {
                        map = "tro",
                        cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
                        desc = "use oxi to replace"
                    },
                    ['toggle_live_update']={
                        map = "tu",
                        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
                        desc = "update change when vim write file."
                    },
                    ['toggle_ignore_case'] = {
                        map = "ti",
                        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
                        desc = "toggle ignore case"
                    },
                    ['toggle_ignore_hidden'] = {
                        map = "th",
                        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
                        desc = "toggle search hidden"
                    },
                    ['resume_last_search'] = {
                        map = "<leader>l",
                        cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
                        desc = "resume last search before close"
                    },
                    -- you can put your mapping here it only use normal mode
                },
                find_engine = {
                    -- rg is map with finder_cmd
                    ['rg'] = {
                        cmd = "rg",
                        -- default args
                        args = {
                            '--color=never',
                            '--no-heading',
                            '--with-filename',
                            '--line-number',
                            '--column',
                        } ,
                        options = {
                            ['ignore-case'] = {
                                value= "--ignore-case",
                                icon="[I]",
                                desc="ignore case"
                            },
                            ['hidden'] = {
                                value="--hidden",
                                desc="hidden file",
                                icon="[H]"
                            },
                            -- you can put any rg search option you want here it can toggle with
                            -- show_option function
                        }
                    },
                    ['ag'] = {
                        cmd = "ag",
                        args = {
                            '--vimgrep',
                            '-s'
                        } ,
                        options = {
                            ['ignore-case'] = {
                                value= "-i",
                                icon="[I]",
                                desc="ignore case"
                            },
                            ['hidden'] = {
                                value="--hidden",
                                desc="hidden file",
                                icon="[H]"
                            },
                        },
                    },
                },
                replace_engine={
                    ['sed']={
                        cmd = "sed",
                        args = nil,
                        options = {
                            ['ignore-case'] = {
                                value= "--ignore-case",
                                icon="[I]",
                                desc="ignore case"
                            },
                        }
                    },
                    -- call rust code by nvim-oxi to replace
                    ['oxi'] = {
                        cmd = 'oxi',
                        args = {},
                        options = {
                            ['ignore-case'] = {
                                value = "i",
                                icon = "[I]",
                                desc = "ignore case"
                            },
                        }
                    }
                },
                default = {
                    find = {
                        --pick one of item in find_engine
                        cmd = "rg",
                        options = {"ignore-case"}
                    },
                    replace={
                        --pick one of item in replace_engine
                        cmd = "sed"
                    }
                },
                replace_vim_cmd = "cdo",
                is_open_target_win = true, --open file on opener window
                is_insert_mode = false  -- start open panel on is_insert_mode
            })
        end
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
                    change = "kc",
                },
            })
        end,
        event = "InsertEnter"
    }
end,
    config = { git = { clone_timeout = nil } }
})
