require("mini.basics").setup({
  options = { basic = true, extra_ui = true, win_borders = "auto" },
  mappings = { basic = false },
  autocommands = { basic = false },
})

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

require("mini.statusline").setup()
require("mini.indentscope").setup({ symbol = "│" })
require("mini.surround").setup()
require("mini.pairs").setup()
require("mini.ai").setup()

require("mini.notify").setup()
vim.notify = require("mini.notify").make_notify()

require("mini.completion").setup({
  lsp_completion = { source_func = "omnifunc", auto_setup = false },
})

require("mini.extra").setup()
require("mini.pick").setup()
require("mini.files").setup()

nmap("<leader>ff", "<cmd>Pick files<cr>")
nmap("<leader>fg", "<cmd>Pick grep_live<cr>")
nmap("<leader>fb", "<cmd>Pick buffers<cr>")
nmap("<leader>fh", "<cmd>Pick help<cr>")
nmap("<leader>fd", "<cmd>Pick diagnostic<cr>")
nmap("<leader>fr", "<cmd>Pick resume<cr>")
nmap("<leader>fe", function() MiniFiles.open() end)
nmap("<leader>fE", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end)
