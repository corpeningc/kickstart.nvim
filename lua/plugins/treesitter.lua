return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' }, -- Load when opening files
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'astro',
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'vue',
        'go',
        'javascript',
        'typescript',
        'tsx',
        'css',
        'scss',
      },
      modules = {},
      sync_install = false, -- Changed to async for faster startup
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      -- Textobjects configuration (merged from treesitter-textobjects.lua)
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']f'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
            ['as'] = { query = '@local.scope', query_group = 'locals', desc = 'Select language scope' },
          },
        },
      },
    }
  end,
}
