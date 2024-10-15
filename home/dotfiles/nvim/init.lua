vim.opt.clipboard:append { 'unnamedplus' }

vim.g.clipboard = {
  name = 'copyq',
  copy = {
    ['+'] = 'copyq add -',
    ['*'] = 'copyq add -',
  },
  paste = {
    ['+'] = 'copyq clipboard',
    ['*'] = 'copyq clipboard',
  },
  cache_enabled = 0,
}

