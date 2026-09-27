# Lua style

- Write strings with single quotes. Escape embedded apostrophes as `\'`.
- Prefer Lua call syntax for `require` and calls with one table argument: use `require 'flash'.jump()` and `require 'flash'.setup { ... }` instead of `require('flash').setup({ ... })`.
- Apply these conventions consistently across Lua files in this repository.
