return {
  "seblj/roslyn.nvim",
  lazy = false,
  config = function()
    require("roslyn").setup({
      config = {
        settings = {
          ["csharp|background_analysis"] = {
            dotnet_compiler_diagnostics_scope = "fullSolution"
          },
          ["csharp|inlay_hints"] = {
            csharp_enable_inlay_hints_for_implicit_object_creation = true,
            csharp_enable_inlay_hints_for_implicit_variable_types = true,
            csharp_enable_inlay_hints_for_lambda_parameter_types = true,
            csharp_enable_inlay_hints_for_types = true,
            dotnet_enable_inlay_hints_for_indexer_parameters = true,
            dotnet_enable_inlay_hints_for_literal_parameters = true,
            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
            dotnet_enable_inlay_hints_for_other_parameters = true,
            dotnet_enable_inlay_hints_for_parameters = true,
            dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
            dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = true,
          },
        }
      },
      exe = {
        "dotnet",
        vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn", "Microsoft.CodeAnalysis.LanguageServer.dll"),
      },
      filewatching = true,
    })


    vim.keymap.set("n", "<leader>p", function()
      local clients = vim.lsp.get_clients()
      for _, value in ipairs(clients) do
        if value.name == "roslyn" then
          vim.notify("roslyn client found")
          value.rpc.request("workspace/diagnostic", { previousResultIds = {} }, function(err, result)
            if err ~= nil then
              print(vim.inspect(err))
            end
            if result ~= nil then
              print(vim.inspect(result))
            end
          end)
        end
      end
    end, { noremap = true, silent = true })
  end
}
