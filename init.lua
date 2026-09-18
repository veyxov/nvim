vim.loader.enable()

local function disable(t, val, suffix)
  for _, n in ipairs(t) do vim.g['loaded_' .. n .. (suffix or '')] = val end
end

disable({ 'netrw', 'netrwPlugin', 'tarPlugin', 'zipPlugin', 'gzip', '2html_plugin', 'tutor_mode_plugin', 'matchit', 'spellfile_plugin', 'fzf' }, 1)
disable({ 'python3', 'ruby', 'perl', 'node' }, 0, '_provider')
