return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').setup()
      require('which-key').register {
        ['g'] = { name = '+Goto', _ = 'which_key_ignore' },
        ['gs'] = { name = '+Surround', _ = 'which_key_ignore' },
        [']'] = { name = '+Next', _ = 'which_key_ignore' },
        ['['] = { name = '+Prev', _ = 'which_key_ignore' },
        ['<Space>b'] = { name = '+Buffer', _ = 'which_key_ignore' },
        ['<Space>c'] = { name = '+Code', _ = 'which_key_ignore' },
        ['<Space>d'] = { name = '+Debug/Document', _ = 'which_key_ignore' },
        ['<Space>f'] = { name = '+File/Find', _ = 'which_key_ignore' },
        ['<Space>g'] = { name = '+Git', _ = 'which_key_ignore' },
        ['<Space>q'] = { name = '+Quit/Session', _ = 'which_key_ignore' },
        ['<Space>r'] = { name = '+Refactoring', _ = 'which_key_ignore' },
        ['<Space>s'] = { name = '+Search', _ = 'which_key_ignore' },
        ['<Space>t'] = { name = '+Test', _ = 'which_key_ignore' },
        ['<Space>u'] = { name = '+UI', _ = 'which_key_ignore' },
        ['<Space>w'] = { name = '+Workspace/Window', _ = 'which_key_ignore' },
        ['<Space>x'] = { name = '+Diagnostics/Quickfix', _ = 'which_key_ignore' },
      }
    end,
  }
}
