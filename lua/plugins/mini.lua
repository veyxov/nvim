local function later(fn) vim.schedule(fn) end

-- immediate: needed at first draw
require 'mini.basics'.setup({
  options = { basic = true, extra_ui = true, win_borders = 'auto' },
  mappings = { basic = false },
})

require 'mini.icons'.setup()
MiniIcons.mock_nvim_web_devicons()

-- deferred: everything else (vim.schedule runs before first keypress)
later(function()
  require 'mini.surround'.setup({
      n_lines = 169, respect_selection_type = true,
      search_method = 'cover_or_next',

      mappings = {
          add = 'rt',
          delete = 'rd',
          find = 'rf',
          find_left = 'rF',
          highlight = 'rh',
          replace = 'rn', -- n = new
      },

  })
  require 'mini.pairs'.setup()
  require 'mini.input'.setup()

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
  vim.notify = require 'mini.notify'.make_notify({
    ERROR = { duration = 10000 },
    WARN = { duration = 7000 },
  })

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
      border = 'rounded', height = h, width = w,
      row = math.floor(0.5 * (vim.o.lines - h)), col = math.floor(0.5 * (vim.o.columns - w)),
    }
  end
  require 'mini.pick'.setup({ options = { use_cache = true }, window = { config = pick_win } })

  require 'mini.files'.setup({
    windows = { preview = true, width_focus = 30, width_preview = 50 },
    options = { permanent_delete = false },
  })
  local files_split = function(buf, lhs, dir)
    vim.keymap.set('n', lhs, function()
      local cur = MiniFiles.get_explorer_state().target_window
      local new = vim.api.nvim_win_call(cur, function()
        vim.cmd(dir .. ' split')
        return vim.api.nvim_get_current_win()
      end)
      MiniFiles.set_target_window(new)
      MiniFiles.go_in({ close_on_file = true })
    end, { buffer = buf })
  end
  local show_dot = false
  autocmd('User', 'minifiles_keys', {
    pattern = 'MiniFilesBufferCreate',
    callback = function(args)
      local b = args.data.buf_id
      files_split(b, '<C-s>', 'belowright horizontal')
      files_split(b, '<C-v>', 'belowright vertical')
      vim.keymap.set('n', 'g.', function()
        show_dot = not show_dot
        local filter = show_dot and function() return true end
          or function(e) return not vim.startswith(e.name, '.') end
        MiniFiles.refresh({ content = { filter = filter } })
      end, { buffer = b })
      vim.keymap.set('n', 'gy', function()
        local p = (MiniFiles.get_fs_entry() or {}).path
        if p then vim.fn.setreg(vim.v.register, p) end
      end, { buffer = b })
    end,
  })
  autocmd('User', 'minifiles_marks', {
    pattern = 'MiniFilesExplorerOpen',
    callback = function()
      MiniFiles.set_bookmark('c', vim.fn.stdpath 'config', { desc = 'Config' })
      MiniFiles.set_bookmark('w', vim.fn.getcwd, { desc = 'cwd' })
    end,
  })

  require 'mini.align'.setup()
  require 'mini.splitjoin'.setup()
  require 'mini.bracketed'.setup()
  require 'mini.jump2d'.setup({ view = { dim = true, n_steps_ahead = 2 }, mappings = { start_jumping = '' } })
  require 'mini.operators'.setup({ replace = { prefix = 'cr' } }) -- 'gr' avoided (LSP grn/gra/grr/gri)

  require 'mini.diff'.setup({
    view = { style = 'sign', signs = { add = '▎', change = '▎', delete = '▁' } },
  })
  require 'mini.git'.setup()
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
      hex = hi.gen_highlighter.hex_color({ style = 'inline' }),
    },
  })

  require 'mini.misc'.setup()
  MiniMisc.setup_restore_cursor()
  MiniMisc.setup_auto_root({ '.git', '.sln', '*.csproj', 'Makefile' })
  MiniMisc.setup_termbg_sync()

  local clue = require 'mini.clue'
  clue.setup({
    triggers = {
      { mode = 'n', keys = '<Leader>' }, { mode = 'x', keys = '<Leader>' },
      { mode = 'n', keys = 'g' }, { mode = 'x', keys = 'g' },
      { mode = 'n', keys = "'" }, { mode = 'n', keys = '`' },
      { mode = 'n', keys = '"' }, { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' }, { mode = 'n', keys = '<C-w>' },
      { mode = 'n', keys = 'z' }, { mode = 'x', keys = 'z' },
      { mode = 'n', keys = '[' }, { mode = 'n', keys = ']' },
    },
    clues = {
      clue.gen_clues.builtin_completion(),
      clue.gen_clues.g(),
      clue.gen_clues.marks(),
      clue.gen_clues.registers(),
      clue.gen_clues.square_brackets(),
      clue.gen_clues.windows({ submode_move = true, submode_navigate = true, submode_resize = true }),
      clue.gen_clues.z(),
    },
    window = { delay = 300 },
  })

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
  callback = function()
    if _G.MiniTrailspace then
      MiniTrailspace.trim()
      MiniTrailspace.trim_last_lines()
    end
  end,
})

lmap('t', cmd 'Pick files')

-- find cluster
lmap('fl', cmd 'Pick grep_live')
lmap('fw', cmd "Pick grep pattern='<cword>'")
lmap('fb', cmd 'Pick buffers')
lmap('fo', cmd 'Pick oldfiles')
lmap('fv', cmd 'Pick visit_paths')
lmap('fG', cmd 'Pick git_files')
lmap('fh', cmd 'Pick help')
lmap('fd', cmd 'Pick diagnostic')
lmap('fr', cmd 'Pick resume')
lmap('fk', cmd 'Pick keymaps')
lmap('fc', cmd 'Pick commands')
lmap('fm', cmd 'Pick marks')
lmap('f:', cmd 'Pick history')
lmap('fq', cmd "Pick list scope='quickfix'")
lmap('f/', cmd "Pick buf_lines scope='current'")

-- lsp cluster (works once a server attaches)
lmap('fs', cmd "Pick lsp scope='document_symbol'")
lmap('fS', cmd "Pick lsp scope='workspace_symbol'")
lmap('fR', cmd "Pick lsp scope='references'")

-- explorer
map('-', function() MiniFiles.open() end)
map('+', function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end)

-- git / diff / jump / misc
lmap('go', function() MiniDiff.toggle_overlay() end)
lmap('gs', function() MiniGit.show_at_cursor() end)
lmap('n', function() MiniNotify.show_history() end)
lmap('z', function() MiniMisc.zoom() end)
map('s', function() MiniJump2d.start(MiniJump2d.builtin_opts.single_character) end, { 'n', 'x', 'o' })

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
