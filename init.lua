-- Single-file config for Neovim 0.13+ (vim.pack + mini.nvim). Sections: gO
vim.g.mapleader = ' '

-- # Helpers ------------------------------------------------------------------

local function gh(repo) return 'https://github.com/' .. repo end

local function pack(repos, opts) vim.pack.add(vim.tbl_map(gh, repos), opts) end

local function map(lhs, rhs, desc, mode)
  vim.keymap.set(mode or 'n', lhs, rhs, { silent = true, desc = desc })
end

local function lmap(lhs, rhs, desc, mode) map('<leader>' .. lhs, rhs, desc, mode) end

local function cmd(s) return '<cmd>' .. s .. '<cr>' end

local group = vim.api.nvim_create_augroup('config', {})
local function autocmd(event, opts)
  opts.group = group
  vim.api.nvim_create_autocmd(event, opts)
end

-- # Plugins ------------------------------------------------------------------

-- before pack(): must see the first install too
autocmd('PackChanged', {
  callback = function(ev)
    local data = ev.data
    if data.spec.name ~= 'nvim-treesitter' or data.kind == 'delete' then return end
    if not data.active then vim.cmd.packadd 'nvim-treesitter' end
    vim.cmd 'TSUpdate'
  end,
})

pack {
  'nvim-mini/mini.nvim',
  'folke/flash.nvim',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/nvim-treesitter-textobjects',
}

-- installed now, loaded on demand with :packadd. Not `load = false`: during init
-- that still puts them on 'rtp' and their plugin/ files get sourced at startup
pack({
  'sindrets/diffview.nvim',
  'MeanderingProgrammer/render-markdown.nvim',
  'mikesmithgh/kitty-scrollback.nvim',
  'nvim-lua/plenary.nvim',
  'GustavEikaas/easy-dotnet.nvim',
}, { load = function() end })

-- errors become warnings instead of aborting the rest of the file
local misc = require 'mini.misc'
misc.setup()
local function now(f) misc.safely('now', f) end
local function later(f) misc.safely('later', f) end
local function on_event(ev, f) misc.safely('event:' .. ev, f) end
local function on_filetype(ft, f) misc.safely('filetype:' .. ft, f) end

-- # Options ------------------------------------------------------------------

local o = vim.o
o.expandtab = true
o.softtabstop = 4
o.shiftwidth = 4
o.tabstop = 4
o.laststatus = 0
o.cmdheight = 0
o.swapfile = false -- agents edit the same files; no swap prompts
o.updatetime = 250 -- drives diagnostic virtual_lines.current_line (CursorHold)
o.timeoutlen = 300
o.confirm = true

vim.diagnostic.config {
  severity_sort = true,
  virtual_lines = { current_line = true },
}

vim.cmd.colorscheme 'catppuccin' -- Latte/Mocha, reloads itself when 'background' changes

now(function()
  require 'mini.basics'.setup {
    options = { basic = true, extra_ui = true, win_borders = 'none' },
    mappings = { basic = false },
    autocommands = { basic = false }, -- no autostart-insert on term: breaks kitty-scrollback
  }
  -- experimental: no "Press ENTER", ephemeral messages; fits cmdheight=0
  require 'vim._core.ui2'.enable()
end)

-- # Keymaps ------------------------------------------------------------------

map('<Esc>', cmd 'nohlsearch', 'Clear search highlight')
map('<C-d>', '<C-d>zz', 'Half page down, centered')
map('<C-u>', '<C-u>zz', 'Half page up, centered')
map('n', 'nzzzv', 'Next match, centered')
map('N', 'Nzzzv', 'Previous match, centered')
map('<', '<gv', 'Dedent, keep selection', 'v')
map('>', '>gv', 'Indent, keep selection', 'v')
map('qu', cmd 'wq', 'Write and quit')
lmap('w', cmd 'wa', 'Write all')
lmap('qu', cmd 'q!', 'Quit without saving')
lmap('v', '<C-V>', 'Visual block') -- <C-v> is paste in the terminal

-- keyboard layout: j/k act as [/], h acts as y
for lhs, rhs in pairs { j = '[', k = ']', h = 'y', ['<leader>h'] = '"+y' } do
  vim.keymap.set({ 'n', 'x', 'o' }, lhs, rhs, { remap = true })
end

-- LSP (K hover, <C-s> signature help, <C-w>d diagnostic float are built in)
map('ta', vim.lsp.buf.code_action, 'LSP code action', { 'n', 'x' })
map('tr', vim.lsp.buf.rename, 'LSP rename')
map('ti', vim.lsp.buf.implementation, 'LSP implementation')
map('td', vim.lsp.buf.type_definition, 'LSP type definition')
map('th', vim.lsp.buf.hover, 'LSP hover')
map('tf', cmd 'Pick lsp scope=\'references\'', 'LSP references')
lmap('ss', cmd 'Pick lsp scope=\'document_symbol\'', 'Document symbols')
lmap('sa', cmd 'Pick lsp scope=\'workspace_symbol\'', 'Workspace symbols')

-- Pickers
lmap('t', cmd 'Pick files', 'Find files')
lmap('fl', cmd 'Pick grep_live', 'Live grep')
lmap('fw', cmd 'Pick grep pattern=\'<cword>\'', 'Grep word under cursor')
lmap('fo', cmd 'Pick oldfiles', 'Old files')
lmap('fd', cmd 'Pick diagnostic', 'Diagnostics')
lmap('fr', cmd 'Pick resume', 'Resume picker')
lmap('fk', cmd 'Pick keymaps', 'Keymaps')

-- Files
map('-', function()
  if not MiniFiles.close() then MiniFiles.open() end
end, 'Files: toggle')
map('+', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, 'Files: open at current file')

-- Git
lmap('gb', cmd 'vert Git blame -- %', 'Git: blame')
lmap('gs', cmd 'Git status', 'Git: status')
lmap('gl', cmd 'Git log --oneline --decorate --graph --all', 'Git: log graph')
lmap('ga.', cmd 'Git add .', 'Git: add all')
lmap('gaa', cmd 'Git add %', 'Git: add file')
lmap('gc', cmd 'Git commit', 'Git: commit')
lmap('gp', cmd 'Git push', 'Git: push')
lmap('gP', cmd 'Git push --force-with-lease', 'Git: force push with lease')
lmap('gd', function() MiniDiff.toggle_overlay() end, 'Git: toggle diff overlay')

-- Jumps
map('s', function() require 'flash'.jump() end, 'Flash jump', { 'n', 'x', 'o' })
map('S', function() require 'flash'.treesitter() end, 'Flash treesitter', { 'n', 'x', 'o' })

-- # mini.nvim ----------------------------------------------------------------

later(function()
  require 'mini.extra'.setup()
  require 'mini.pick'.setup {
    options = { use_cache = true },
    mappings = { choose_marked = '<C-d>', mark = '<C-,>', mark_all = '<C-a>' },
  }
  require 'mini.files'.setup {
    mappings = { go_in = '<Right>', go_out = '<Left>' },
    options = { permanent_delete = false }, -- delete moves to trash
    windows = { preview = true, width_preview = 50 },
  }

  require 'mini.icons'.setup()
  MiniIcons.mock_nvim_web_devicons()
  MiniIcons.tweak_lsp_kind()

  require 'mini.surround'.setup {
    n_lines = 169,
    respect_selection_type = true,
    search_method = 'cover_or_next',
    mappings = { add = 'ra', delete = 'rd', find = 'rf', find_left = 'rF', highlight = 'rh', replace = 'rn' },
  }
  require 'mini.pairs'.setup()
  require 'mini.cmdline'.setup()
  require 'mini.notify'.setup()
  require 'mini.bracketed'.setup()
  require 'mini.git'.setup()
  require 'mini.diff'.setup {
    view = { style = 'sign', signs = { add = '▎', change = '▎', delete = '▁' } },
  }

  local ai = require 'mini.ai'
  ai.setup {
    n_lines = 500,
    custom_textobjects = {
      f = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
      c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
      a = ai.gen_spec.treesitter { a = '@parameter.outer', i = '@parameter.inner' },
    },
  }

  require 'mini.trailspace'.setup()
  autocmd('BufWritePre', {
    desc = 'Trim trailing whitespace and blank lines',
    callback = function(args)
      if not vim.bo[args.buf].modifiable then return end
      MiniTrailspace.trim()
      MiniTrailspace.trim_last_lines()
    end,
  })

  require 'mini.completion'.setup()

  -- <Tab>/<CR>/<BS> across completion and pairs
  local multistep = require 'mini.keymap'.map_multistep
  multistep('i', '<Tab>', { 'pmenu_next' })
  multistep('i', '<S-Tab>', { 'pmenu_prev' })
  multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  multistep('i', '<BS>', { 'minipairs_bs' })

  MiniMisc.setup_restore_cursor()
  MiniMisc.setup_auto_root { '.git', '.sln', '*.csproj', 'Makefile' }
end)

-- # Other plugins ------------------------------------------------------------

later(function()
  local labels = 'rsndwaeihtjfmpvxglcbuoyk./?\'_,:qz'
  require 'flash'.setup { labels = labels, modes = { treesitter = { labels = labels } } }

  require 'nvim-treesitter'.install {
    'lua', 'luadoc', 'vim', 'vimdoc', 'query',
    'c_sharp', 'markdown', 'markdown_inline', 'html', 'latex',
    'json', 'yaml', 'toml', 'bash', 'diff', 'sql',
  }
end)

autocmd('FileType', {
  desc = 'Start treesitter when a parser exists',
  callback = function(args) pcall(vim.treesitter.start, args.buf) end,
})

on_event('CmdUndefined~Diffview*', function()
  vim.cmd.packadd 'diffview.nvim'
  local actions = require 'diffview.actions'
  local close = { 'n', 'gd', cmd 'DiffviewClose', { desc = 'Diffview: close' } }
  require 'diffview'.setup {
    keymaps = {
      view = { close },
      file_panel = {
        { 'n', 'e', actions.select_next_entry },
        { 'n', 'i', actions.select_prev_entry },
        close,
      },
      file_history_panel = { close },
    },
  }
end)
map('gd', cmd 'DiffviewOpen', 'Diffview: open (gd again closes)')
lmap('gL', cmd 'DiffviewFileHistory %', 'Diffview: file history')

on_filetype('markdown', function()
  vim.cmd.packadd 'render-markdown.nvim'
  require 'render-markdown'.setup {}
end)

local function kitty_scrollback()
  vim.cmd.packadd 'kitty-scrollback.nvim'
  require 'kitty-scrollback'.setup()
end
if vim.env.KITTY_SCROLLBACK_NVIM == 'true' then
  later(kitty_scrollback)
else
  on_event('CmdUndefined~KittyScrollback*', kitty_scrollback)
end

-- # LSP ----------------------------------------------------------------------

local version = tostring(vim.version())
vim.lsp.config('copilot', {
  cmd = { 'copilot-language-server', '--stdio' },
  root_markers = { '.git' },
  init_options = {
    editorInfo = { name = 'Neovim', version = version },
    editorPluginInfo = { name = 'Neovim', version = version },
  },
})
vim.lsp.config('harper_ls', {
  cmd = { 'harper-ls', '--stdio' },
  filetypes = { 'markdown', 'gitcommit', 'text' },
})

-- after mini.completion: servers must start with its capabilities
later(function()
  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
  vim.lsp.enable { 'copilot', 'harper_ls' }
  vim.lsp.inline_completion.enable()
end)

vim.keymap.set('i', '<Right>', function()
  if not vim.lsp.inline_completion.get() then return '<Right>' end
end, { expr = true, replace_keycodes = true, desc = 'Accept Copilot suggestion' })

local dotnet_loaded = false
autocmd('FileType', {
  pattern = { 'cs', 'fsharp' },
  callback = function(args)
    -- pickers set filetype=cs on preview scratch buffers; don't start roslyn for those
    if dotnet_loaded or vim.bo[args.buf].buftype ~= '' then return end
    dotnet_loaded = true
    vim.cmd.packadd 'plenary.nvim'
    vim.cmd.packadd 'easy-dotnet.nvim'
    require 'easy-dotnet'.setup {
      picker = 'basic', -- mini.pick unsupported
      test_runner = { auto_start_testrunner = false },
      lsp = {
        razor = { enabled = false },
        easy_dotnet_extension_enabled = true,
        enhanced_rename = true, -- renaming a type renames its file
        create_type_from_usage = true,
        restart_roslyn_on_branch_change = true,
        auto_refresh_codelens = false,
        filewatching = 'off', -- roslyn's own watcher burns CPU on big solutions
        background_analysis = { dotnet_analyzer_diagnostics_scope = 'openFiles' },
        config = {
          settings = {
            ['csharp|inlay_hints'] = {
              csharp_enable_inlay_hints_for_types = true,
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              dotnet_enable_inlay_hints_for_parameters = true,
              dotnet_enable_inlay_hints_for_literal_parameters = true,
              dotnet_enable_inlay_hints_for_indexer_parameters = true,
            },
          },
        },
      },
    }
    -- easy-dotnet ignores on_init, so drop semantic tokens on attach: treesitter
    -- owns highlighting (keeps SQL injected into C# strings visible)
    autocmd('LspAttach', {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not (client and client.name == 'easy_dotnet') then return end
        client.server_capabilities.semanticTokensProvider = nil
        vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
      end,
    })
  end,
})

-- # Autocmds -----------------------------------------------------------------

autocmd('TextYankPost', { callback = function() vim.hl.hl_op() end })

autocmd('BufWritePre', {
  desc = 'Format with the attached LSP',
  callback = function(args)
    if #vim.lsp.get_clients { bufnr = args.buf, method = 'textDocument/formatting' } == 0 then return end
    vim.lsp.buf.format { bufnr = args.buf, timeout_ms = 1000 }
  end,
})
