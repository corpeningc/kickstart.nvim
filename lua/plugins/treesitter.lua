return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    local parsers = {
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
      'javascript',
      'typescript',
      'tsx',
      'css',
      'scss',
    }
    require('nvim-treesitter').install(parsers)

    -- Start treesitter highlighting for any filetype that has a parser installed
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter-highlight', { clear = true }),
      callback = function(event)
        pcall(vim.treesitter.start, event.buf)
      end,
    })

    -- Textobjects (nvim-treesitter-textobjects, main branch)
    require('nvim-treesitter-textobjects').setup {
      select = { lookahead = true },
      move = { set_jumps = true },
    }

    local select = require 'nvim-treesitter-textobjects.select'
    local move = require 'nvim-treesitter-textobjects.move'

    for key, query in pairs {
      af = '@function.outer',
      ['if'] = '@function.inner',
      ac = '@class.outer',
      ic = '@class.inner',
    } do
      vim.keymap.set({ 'x', 'o' }, key, function()
        select.select_textobject(query, 'textobjects')
      end, { desc = 'Select ' .. query })
    end
    vim.keymap.set({ 'x', 'o' }, 'as', function()
      select.select_textobject('@local.scope', 'locals')
    end, { desc = 'Select language scope' })

    vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
      move.goto_next_start('@function.outer', 'textobjects')
    end, { desc = 'Next function start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
      move.goto_next_start('@class.outer', 'textobjects')
    end, { desc = 'Next class start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
      move.goto_previous_start('@function.outer', 'textobjects')
    end, { desc = 'Previous function start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
      move.goto_previous_start('@class.outer', 'textobjects')
    end, { desc = 'Previous class start' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
      move.goto_previous_end('@function.outer', 'textobjects')
    end, { desc = 'Previous function end' })
    vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
      move.goto_previous_end('@class.outer', 'textobjects')
    end, { desc = 'Previous class end' })
  end,
}
