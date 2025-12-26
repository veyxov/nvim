return {
    "GustavEikaas/easy-dotnet.nvim",
    lazy = false,
    opts = {
        "GustavEikaas/easy-dotnet.nvim",
        -- 'nvim-telescope/telescope.nvim' or 'ibhagwan/fzf-lua' or 'folke/snacks.nvim'
        -- are highly recommended for a better experience
        config = function()
            local dotnet = require("easy-dotnet")
            -- Options are not required
            dotnet.setup({
                lsp = {
                    enabled = true, -- Enable builtin roslyn lsp
                    roslynator_enabled = true, -- Automatically enable roslynator analyzer
                    analyzer_assemblies = {}, -- Any additional roslyn analyzers you might use like SonarAnalyzer.CSharp
                    config = {},
                },
                debugger = {
                    bin_path = '/usr/bin/netcoredbg',
                    apply_value_converters = true,
                    auto_register_dap = true,
                    mappings = {
                        open_variable_viewer = { lhs = "T", desc = "open variable viewer" },
                    },
                },
                ---@type TestRunnerOptions
                test_runner = {
                    ---@type "split" | "vsplit" | "float" | "buf"
                    viewmode = "float",
                    ---@type number|nil
                    vsplit_width = nil,
                    ---@type string|nil "topleft" | "topright" 
                    vsplit_pos = nil,
                    enable_buffer_test_execution = true, --Experimental, run tests directly from buffer
                    noBuild = true,
                    icons = {
                        passed = "",
                        skipped = "",
                        failed = "",
                        success = "",
                        reload = "",
                        test = "",
                        sln = "󰘐",
                        project = "󰘐",
                        dir = "",
                        package = "",
                    },
                    mappings = {
                        run_test_from_buffer = { lhs = "<leader>r", desc = "run test from buffer" },
                        peek_stack_trace_from_buffer = { lhs = "<leader>p", desc = "peek stack trace from buffer" },
                        filter_failed_tests = { lhs = "<leader>fe", desc = "filter failed tests" },
                        debug_test = { lhs = "<leader>d", desc = "debug test" },
                        go_to_file = { lhs = "g", desc = "go to file" },
                        run_all = { lhs = "<leader>R", desc = "run all tests" },
                        run = { lhs = "<leader>r", desc = "run test" },
                        peek_stacktrace = { lhs = "<leader>p", desc = "peek stacktrace of failed test" },
                        expand = { lhs = "o", desc = "expand" },
                        expand_node = { lhs = "E", desc = "expand node" },
                        expand_all = { lhs = "-", desc = "expand all" },
                        collapse_all = { lhs = "W", desc = "collapse all" },
                        close = { lhs = "q", desc = "close testrunner" },
                        refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" }
                    },
                    --- Optional table of extra args e.g "--blame crash"
                    additional_args = {}
                },
                new = {
                    project = {
                        prefix = "sln" -- "sln" | "none"
                    }
                },
                ---@param action "test" | "restore" | "build" | "run"
                terminal = function(path, action, args)
                    args = args or ""
                    local commands = {
                        run = function() return string.format("dotnet run --project %s %s", path, args) end,
                        test = function() return string.format("dotnet test %s %s", path, args) end,
                        restore = function() return string.format("dotnet restore %s %s", path, args) end,
                        build = function() return string.format("dotnet build %s %s", path, args) end,
                        watch = function() return string.format("dotnet watch --project %s %s", path, args) end,
                    }
                    local command = commands[action]()
                    if require("easy-dotnet.extensions").isWindows() == true then command = command .. "\r" end
                    vim.cmd("vsplit")
                    vim.cmd("term " .. command)
                end,
                csproj_mappings = true,
                fsproj_mappings = true,
                auto_bootstrap_namespace = {
                    --block_scoped, file_scoped
                    type = "block_scoped",
                    enabled = true,
                    use_clipboard_json = {
                        behavior = "prompt", --'auto' | 'prompt' | 'never',
                        register = "+", -- which register to check
                    },
                },
                server = {
                    ---@type nil | "Off" | "Critical" | "Error" | "Warning" | "Information" | "Verbose" | "All"
                    log_level = nil,
                },
                -- choose which picker to use with the plugin
                -- possible values are "telescope" | "fzf" | "snacks" | "basic"
                -- if no picker is specified, the plugin will determine
                -- the available one automatically with this priority:
                -- telescope -> fzf -> snacks ->  basic
                picker = "snacks",
                background_scanning = true,
                notifications = {
                    --Set this to false if you have configured lualine to avoid double logging
                    handler = function(start_event)
                        local spinner = require("easy-dotnet.ui-modules.spinner").new()
                        spinner:start_spinner(start_event.job.name)
                        ---@param finished_event JobEvent
                        return function(finished_event)
                            spinner:stop_spinner(finished_event.result.msg, finished_event.result.level)
                        end
                    end,
                },
                diagnostics = {
                    default_severity = "error",
                    setqflist = false,
                },
            })

            -- Example command
            vim.api.nvim_create_user_command('Secrets', function()
                dotnet.secrets()
            end, {})

            -- Example keybinding
            vim.keymap.set("n", "<C-p>", function()
                dotnet.run_project()
            end)
        end
    },
    config = function()
        require("easy-dotnet").setup()
    end
}
