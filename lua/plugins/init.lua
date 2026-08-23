autocmd('PackChanged', 'pack', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and ev.data.kind ~= 'delete' then
      vim.cmd 'TSUpdate'
    end
  end,
})

vim.pack.add({
  { src = gh('nvim-mini/mini.nvim') },
  { src = gh('nvim-treesitter/nvim-treesitter') },
  { src = gh('nvim-treesitter/nvim-treesitter-textobjects') },
  { src = gh('sindrets/diffview.nvim') },
  { src = gh('mistweaverco/kulala.nvim') },
  { src = gh('zbirenbaum/copilot.lua') },
  { src = gh('MeanderingProgrammer/render-markdown.nvim') },
})

require 'plugins.mini'
require 'plugins.treesitter'
require 'plugins.dotnet'
require 'plugins.rust'
require 'plugins.harper'
require 'plugins.diffview'
require 'plugins.kulala'
require 'plugins.copilot'
require 'plugins.markdown'

-- nvim 0.11+ tracks terminal/system background natively (OSC 11); just react to it,
-- don't set vim.o.background ourselves or it stops auto-tracking
local function apply_system_colorscheme()
  vim.cmd.colorscheme(vim.o.background == 'dark' and 'wildcharm' or 'peachpuff')
end

apply_system_colorscheme()
autocmd('OptionSet', 'system-appearance', { pattern = 'background', callback = apply_system_colorscheme })

-- format on save with whatever lsp client attached (roslyn/easy-dotnet); no-op if none support it
autocmd('BufWritePre', 'fmt', {
  callback = function(a) vim.lsp.buf.format({ bufnr = a.buf, timeout_ms = 1000 }) end,
})
