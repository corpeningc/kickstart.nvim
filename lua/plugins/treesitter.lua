return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
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
      sync_install = true,
      ignore_install = {},
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}
