return {
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    priority = 10, -- Low priority to catch other plugins' keybindings
    config = function()
        require("tiny-glimmer").setup({
            -- Enable/disable the plugin
            enabled = true,

            -- Disable warnings for debugging highlight issues
            disable_warnings = true,

            -- Animation refresh rate in milliseconds
            refresh_interval_ms = 8,

            -- Automatic keybinding overwrites
            overwrite = {
                -- Automatically map keys to overwrite operations
                -- Set to false if you have custom mappings or prefer manual API calls
                auto_map = true,

                -- Yank operation animation
                yank = {
                    enabled = true,
                    default_animation = "fade",
                },

                -- Search navigation animation
                search = {
                    enabled = true,
                    default_animation = "pulse",
                    next_mapping = "n",      -- Key for next match
                    prev_mapping = "N",      -- Key for previous match
                },

                -- Paste operation animation
                paste = {
                    enabled = true,
                    default_animation = "reverse_fade",
                    paste_mapping = "p",     -- Paste after cursor
                    Paste_mapping = "P",     -- Paste before cursor
                },

                -- Undo operation animation
                undo = {
                    enabled = true,
                    default_animation = {
                        name = "fade",
                        settings = {
                            from_color = "DiffDelete",
                            max_duration = 500,
                            min_duration = 500,
                        },
                    },
                    undo_mapping = "u",
                },

                -- Redo operation animation
                redo = {
                    enabled = true,
                    default_animation = {
                        name = "fade",
                        settings = {
                            from_color = "DiffAdd",
                            max_duration = 500,
                            min_duration = 500,
                        },
                    },
                    redo_mapping = "<c-r>",
                },
            },

            -- Third-party plugin integrations
            support = {
                -- Support for gbprod/substitute.nvim
                -- Usage: require("substitute").setup({
                    --     on_substitute = require("tiny-glimmer.support.substitute").substitute_cb,
                    --     highlight_substituted_text = { enabled = false },
                    -- })
                    substitute = {
                        enabled = true,
                        default_animation = "fade",
                    },
                },

                -- Special animation presets
                presets = {
                    -- Pulsar-style cursor highlighting on specific events
                    pulsar = {
                        enabled = true,
                        on_events = { "CursorMoved", "CmdlineEnter", "WinEnter" },
                        default_animation = {
                            name = "fade",
                            settings = {
                                max_duration = 1000,
                                min_duration = 1000,
                                from_color = "DiffDelete",
                                to_color = "Normal",
                            },
                        },
                    },
                },

                -- Override background color for animations (for transparent backgrounds)
                transparency_color = nil,

                -- Animation configurations
                animations = {
                    fade = {
                        max_duration = 400,              -- Maximum animation duration in ms
                        min_duration = 300,              -- Minimum animation duration in ms
                        easing = "outQuad",              -- Easing function
                        chars_for_max_duration = 10,    -- Character count for max duration
                        from_color = "Visual",           -- Start color (highlight group or hex)
                        to_color = "Normal",             -- End color (highlight group or hex)
                    },
                    reverse_fade = {
                        max_duration = 380,
                        min_duration = 300,
                        easing = "outBack",
                        chars_for_max_duration = 10,
                        from_color = "Visual",
                        to_color = "Normal",
                    },
                    bounce = {
                        max_duration = 500,
                        min_duration = 400,
                        chars_for_max_duration = 20,
                        oscillation_count = 1,          -- Number of bounces
                        from_color = "Visual",
                        to_color = "Normal",
                    },
                    left_to_right = {
                        max_duration = 350,
                        min_duration = 350,
                        min_progress = 0.85,
                        chars_for_max_duration = 25,
                        lingering_time = 50,            -- Time to linger after completion
                        from_color = "Visual",
                        to_color = "Normal",
                    },
                    pulse = {
                        max_duration = 600,
                        min_duration = 400,
                        chars_for_max_duration = 15,
                        pulse_count = 2,                -- Number of pulses
                        intensity = 1.2,                -- Pulse intensity
                        from_color = "Visual",
                        to_color = "Normal",
                    },
                    rainbow = {
                        max_duration = 600,
                        min_duration = 350,
                        chars_for_max_duration = 20,
                        -- Note: Rainbow animation does not use from_color/to_color
                    },

                    -- Custom animation example
                    custom = {
                        max_duration = 350,
                        chars_for_max_duration = 40,
                        color = "#ff0000",  -- Custom property

                        -- Custom effect function
                        -- @param self table - The effect object with settings
                        -- @param progress number - Animation progress [0, 1]
                        -- @return string color - Hex color or highlight group
                        -- @return number progress - How much of the animation to draw
                        effect = function(self, progress)
                            return self.settings.color, progress
                        end,
                    },
                },

                -- Filetypes to disable hijacking/overwrites
                hijack_ft_disabled = {
                    "alpha",
                    "snacks_dashboard",
                },

                -- Virtual text display priority
                virt_text = {
                    priority = 2048,  -- Higher values appear above other plugins
                },
            })
        end,
    }
