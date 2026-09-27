# Flash.nvim configuration notes

Research checked 2026-09-27 against the [official Flash.nvim README](https://github.com/folke/flash.nvim) and its [default configuration in that README](https://github.com/folke/flash.nvim#configuration). Context7 did not return Flash.nvim in its library catalog, so these notes use the upstream project sources directly.

## Recommended baseline

- The upstream `lazy.nvim` example loads Flash on `VeryLazy`, uses `opts = {}`, and adds explicit mappings. Since this config uses Neovim's built-in package loader rather than lazy.nvim, preserve the useful part of the pattern: keep plugin loading in its own plugin file and call `require('flash').jump()` from a Lua callback. The README warns that a manually defined `:lua` mapping breaks dot-repeat; a Lua function callback (or `<cmd>lua ...<cr>`) preserves it.
- Flash is configurable but its defaults already cover the common jump flow. Start with defaults and add only intentional overrides. Defaults include case-aware exact matching, forward search with wrap, multi-window matching, labels from `asdfghjklqwertyuiopzxcvbnm`, and a jumplist entry for jumps.
- Flash does **not** enable `/` and `?` search integration by default. It can be turned on globally with `modes.search.enabled = true`, or toggled just for an individual search using `require('flash').toggle()`. Search mode uses regex search and can update search history/register on a jump; its default mode also disables the backdrop.
- `flash.jump()` accepts a pattern of any length before the user chooses a label, which closely matches the desired search-then-select workflow.

## Upstream keymap suggestions

The README's `lazy.nvim` example recommends the following bindings. The callback shape is also applicable to this config's `map` helper:

| Key | Modes | Action | Why it may be useful |
| --- | --- | --- | --- |
| `s` | normal, visual, operator-pending | `require('flash').jump()` | General search-and-label jump. |
| `S` | normal, visual, operator-pending | `require('flash').treesitter()` | Select a surrounding syntax node by label. Requires Treesitter parsers for useful syntax-aware behavior. |
| `r` | operator-pending | `require('flash').remote()` | Choose a remote location, then complete an operator motion there. |
| `R` | operator-pending, visual | `require('flash').treesitter_search()` | Search text and select surrounding syntax nodes; useful for operations such as `yR`. |
| `<C-s>` | command-line | `require('flash').toggle()` | Toggle labels while entering a normal `/` or `?` search, without enabling integration for every search. |

The existing `s` binding already follows the upstream suggestion. `S`, `r`, `R`, and `<C-s>` are optional extensions, not required setup. The local `<leader>r` reference-picker binding uses a different prefix from the suggested operator-pending `r` mapping. Check actual mode-specific mappings before adding the others.

For `f`, `t`, `F`, and `T`, Flash has a separate character-motion mode. Its defaults keep these motions enabled, turn jump labels off, and let `;` / `,` repeat forward/backward. The README documents `modes.char.jump_labels = true` as an option if you want labels during these motions; it is not needed for the standalone `s` jump workflow.

## Sources

- [Flash.nvim README: installation, mappings, configuration, and usage](https://github.com/folke/flash.nvim)
- [Flash.nvim default configuration source](https://github.com/folke/flash.nvim/blob/main/lua/flash/config.lua)
