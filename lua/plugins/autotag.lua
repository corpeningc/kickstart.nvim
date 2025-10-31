return {
  'windwp/nvim-ts-autotag',
  ft = { 'html', 'javascriptreact', 'typescriptreact', 'astro', 'glimmer', 'handlebars', 'liquid', 'markdown', 'php', 'rescript' },
  config = function()
    require('nvim-ts-autotag').setup {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    }
  end,
}
