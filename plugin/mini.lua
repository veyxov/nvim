vim.pack.add({ { src = gh('nvim-mini/mini.nvim') } })

-- immediate: needed at first draw
require 'mini.basics'.setup({
  options = { basic = true, extra_ui = true, win_borders = 'none' },
  mappings = { basic = false },
  autocommands = { basic = false }, -- no autostart-insert on term: breaks kitty-scrollback
})

require 'mini.icons'.setup()
MiniIcons.mock_nvim_web_devicons()

-- mini.basics' autocommands.basic is off (its terminal auto-insert breaks
-- kitty-scrollback), which also drops its yank highlight; restore just that
autocmd('TextYankPost', 'yank', { callback = function() vim.hl.on_yank() end })

-- deferred: everything else (vim.schedule runs before first keypress)
later(function()
  require 'mini.surround'.setup({
      n_lines = 169, respect_selection_type = true,
      search_method = 'cover_or_next',

      mappings = {
          add = 'ra',
          delete = 'rd',
          find = 'rf',
          find_left = 'rF',
          highlight = 'rh',
          replace = 'rn', -- n = new
      },

  })
  require 'mini.pairs'.setup()
  require 'mini.input'.setup()
  require 'mini.cmdline'.setup()

  local gen_ai = require 'mini.extra'.gen_ai_spec
  local ai = require 'mini.ai'
  ai.setup({
    n_lines = 500,
    custom_textobjects = {
      f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
      c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
      a = ai.gen_spec.treesitter({ a = '@parameter.outer', i = '@parameter.inner' }),
      o = ai.gen_spec.treesitter({
        a = { '@conditional.outer', '@loop.outer', '@block.outer' },
        i = { '@conditional.inner', '@loop.inner', '@block.inner' },
      }),
      B = gen_ai.buffer(),
      D = gen_ai.diagnostic(),
      I = gen_ai.indent(),
      L = gen_ai.line(),
      N = gen_ai.number(),
    },
  })

  require 'mini.notify'.setup()
  local process_items = function(items, base)
    return MiniCompletion.default_process_items(items, base, {
      filtersort = 'fuzzy',
      kind_priority = { Text = -1, Snippet = 99 }, -- drop Text noise, snippets after real items
    })
  end
  require 'mini.completion'.setup({
    lsp_completion = { source_func = 'omnifunc', process_items = process_items }
  })
  MiniIcons.tweak_lsp_kind() -- lsp kind icons in completion/symbols (loads vim.lsp, hence deferred)
  -- advertise snippet + auto-import (additionalTextEdits) support to every server
  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })

  require 'mini.extra'.setup()
  local pick_win = function()
    local h, w = math.floor(0.618 * vim.o.lines), math.floor(0.618 * vim.o.columns)
    return {
      border = 'none', height = h, width = w,
      row = math.floor(0.5 * (vim.o.lines - h)), col = math.floor(0.5 * (vim.o.columns - w)),
    }
  end
  require 'mini.pick'.setup({
    options = { use_cache = true },
    window = { config = pick_win },
    mappings = { choose_marked = '<C-d>', mark = '<C-,>', mark_all = '<C-a>' },
  })

  require 'mini.files'.setup({
    mappings = { go_in = '<Right>', go_out = '<Left>' },
    options = { permanent_delete = false }, -- delete = move to trash, not gone forever
    windows = { preview = true, width_preview = 50 },
  })
  autocmd('User', 'files-bookmarks', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
      MiniFiles.set_bookmark('c', vim.fn.stdpath 'config', { desc = 'Config' })
      MiniFiles.set_bookmark('w', vim.fn.getcwd, { desc = 'Working directory' })
      MiniFiles.set_bookmark('~', '~', { desc = 'Home' })
    end,
  })
  -- g. toggles dotfiles (mini.files shows everything by default)
  local show_dotfiles = true
  autocmd('User', 'files-dotfiles', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local toggle = function()
        show_dotfiles = not show_dotfiles
        local filter = show_dotfiles and function() return true end
          or function(entry) return not vim.startswith(entry.name, '.') end
        MiniFiles.refresh({ content = { filter = filter } })
      end
      vim.keymap.set('n', 'g.', toggle, { buffer = args.data.buf_id })
    end,
  })
  require 'mini.align'.setup()
  require 'mini.splitjoin'.setup()
  require 'mini.bracketed'.setup()
  require 'mini.jump2d'.setup({ view = { dim = true, n_steps_ahead = 2 }, mappings = { start_jumping = '' } })
  require 'mini.operators'.setup()

  require 'mini.diff'.setup({
    view = { style = 'sign', signs = { add = '▎', change = '▎', delete = '▁' } },
  })

  require 'mini.git'.setup()
  lmap('gg', cmd 'lua MiniGit.show_at_cursor()')
  lmap('gb', cmd 'vert Git blame -- %')
  lmap('gc', cmd 'Git commit')
  lmap('ga.', cmd 'Git add .')
  lmap('gaa', cmd 'Git add %')
  lmap('gp', cmd 'Git push')
  lmap('gP', cmd 'Git push --fore')

  lmap('gs', cmd 'Git status')
  lmap('gl', cmd 'Git log --oneline --decorate --graph --all')
  lmap('gm', cmd 'Git merge')
  lmap('gh', cmd 'Git diff -- %')

  require 'mini.trailspace'.setup()
  require 'mini.visits'.setup({ silent = true })

  local snippets = require 'mini.snippets'
  snippets.setup({ snippets = { snippets.gen_loader.from_lang() } })
  snippets.start_lsp_server() -- show snippets in completion menu

  -- mini.keymap: smart <Tab>/<CR>/<BS> across snippets + completion + pairs
  local multistep = require 'mini.keymap'.map_multistep
  multistep('i', '<Tab>', { 'minisnippets_next', 'minisnippets_expand', 'pmenu_next' })
  multistep('i', '<S-Tab>', { 'minisnippets_prev', 'pmenu_prev' })
  multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  multistep('i', '<BS>', { 'minipairs_bs' })

  local hi = require 'mini.hipatterns'
  hi.setup({
    highlighters = {
      fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
      hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
      todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
      note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
      hex = hi.gen_highlighter.hex_color(),
    },
  })

  require 'mini.misc'.setup()
  MiniMisc.setup_restore_cursor()
  MiniMisc.setup_auto_root({ '.git', '.sln', '*.csproj', 'Makefile' })
  MiniMisc.setup_termbg_sync()

  -- fold git/diff buffers (e.g. :Git log --patch)
  autocmd('FileType', 'gitfold', {
    pattern = { 'git', 'diff' },
    callback = function()
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.MiniGit.diff_foldexpr()'
    end,
  })
end)

-- trim trailing whitespace + blank lines on save (mini.trailspace)
autocmd('BufWritePre', 'trim', {
  callback = function(args)
    if vim.bo[args.buf].modifiable and _G.MiniTrailspace then
      MiniTrailspace.trim()
      MiniTrailspace.trim_last_lines()
    end
  end,
})

lmap('t', cmd 'Pick files')

-- find cluster
lmap('fl', cmd 'Pick grep_live')
lmap('fw', cmd "Pick grep pattern='<cword>'")
lmap('fo', cmd 'Pick oldfiles')
lmap('fv', cmd 'Pick visit_paths')
lmap('fd', cmd 'Pick diagnostic')
lmap('fr', cmd 'Pick resume')
lmap('fk', cmd 'Pick keymaps')
lmap('fq', cmd "Pick list scope='quickfix'")
lmap('f/', cmd "Pick buf_lines scope='current'")

-- lsp cluster (works once a server attaches)
lmap('ss', cmd "Pick lsp scope='document_symbol'")
lmap('sa', cmd "Pick lsp scope='workspace_symbol'")
lmap('r', cmd "Pick lsp scope='references'")

-- explorer
map('-', function() MiniFiles.open() end)
map('+', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end)

-- git / diff / jump / misc
lmap('go', function() MiniDiff.toggle_overlay() end)
lmap('z', function() MiniMisc.zoom() end)
local function case_insensitive_pattern(str)
  return (vim.pesc(str):gsub('%a', function(c) return '[' .. c:lower() .. c:upper() .. ']' end))
end

map('s', function()
  local opts = {
    spotter = function() return {} end,
    allowed_lines = { blank = false, fold = false },
  }
  opts.hooks = {
    before_start = function()
      local ok1, char1 = pcall(vim.fn.getcharstr)
      if not ok1 or char1 == '\27' then return end
      vim.cmd.echon(("'%s'"):format(char1))
      local ok2, char2 = pcall(vim.fn.getcharstr)
      local query = (ok2 and char2 ~= '\27') and (char1 .. char2) or char1
      opts.spotter = MiniJump2d.gen_spotter.pattern(case_insensitive_pattern(query))
    end,
  }
  MiniJump2d.start(opts)
end, { 'n', 'x', 'o' })

-- visits: frecency (recency_weight 1=recent, 0.5=frecent, 0=frequent) + 'core' label workflow
local function visit(global, weight, filter)
  return function()
    MiniExtra.pickers.visit_paths({
      cwd = global and '' or vim.fn.getcwd(),
      recency_weight = weight,
      filter = filter,
    })
  end
end
lmap('vr', visit(true, 1))
lmap('vR', visit(false, 1))
lmap('vy', visit(true, 0.5))
lmap('vf', visit(true, 0))
lmap('vc', visit(false, 0.5, 'core'))
lmap('vl', function() MiniExtra.pickers.visit_labels() end)
lmap('vv', function() MiniVisits.add_label 'core' end)
lmap('vd', function() MiniVisits.remove_label 'core' end)
