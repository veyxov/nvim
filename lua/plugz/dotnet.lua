return {
    "GustavEikaas/easy-dotnet.nvim",
    lazy = false,
    opts = {
        lsp = {
            enabled = true,
            roslynator_enabled = true,
            analyzer_assemblies = {},
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
        test_runner = {
            viewmode = "float",
            vsplit_width = nil,
            vsplit_pos = nil,
            enable_buffer_test_execution = true,
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
                refresh_testrunner = { lhs = "<C-r>", desc = "refresh testrunner" },
            },
            additional_args = {},
        },
        new = {
            project = {
                prefix = "sln",
            },
        },
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
            type = "block_scoped",
            enabled = true,
            use_clipboard_json = {
                behavior = "prompt",
                register = "+",
            },
        },
        server = {
            log_level = nil,
        },
        picker = "snacks",
        background_scanning = true,
        notifications = {
            handler = function(start_event)
                local spinner = require("easy-dotnet.ui-modules.spinner").new()
                spinner:start_spinner(start_event.job.name)
                return function(finished_event)
                    spinner:stop_spinner(finished_event.result.msg, finished_event.result.level)
                end
            end,
        },
        diagnostics = {
            default_severity = "error",
            setqflist = false,
        },
    },
    config = function(_, opts)
        local dotnet = require("easy-dotnet")
        dotnet.setup(opts)

        vim.api.nvim_create_user_command('Secrets', function()
            dotnet.secrets()
        end, {})

        vim.keymap.set("n", "<C-p>", function()
            dotnet.run_project()
        end)
    end,
}
