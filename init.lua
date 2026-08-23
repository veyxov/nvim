vim.loader.enable()

local function disable(names, value, prefix, suffix)
  prefix, suffix = prefix or 'loaded_', suffix or '_provider'
  for _, n in ipairs(names) do vim.g[prefix .. n .. suffix] = value end
end

disable({
  'netrw', 'netrwPlugin', 'tarPlugin', 'zipPlugin', 'gzip',
  '2html_plugin', 'tutor_mode_plugin', 'matchit', 'spellfile_plugin', 'fzf',
}, 1, nil, '')
disable({ 'python3', 'ruby', 'perl', 'node' }, 0)
