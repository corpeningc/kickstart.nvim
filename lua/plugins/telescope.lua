return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',

      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!
    -- [[ Configure Telescope ]]
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }
    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = '[S]earch [N]eovim files' })

    -- Custom directory picker
    -- Custom directory picker
    local function cd_picker()
      local pickers = require 'telescope.pickers'
      local finders = require 'telescope.finders'
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'
      local conf = require('telescope.config').values

      local repo_path = vim.fn.getenv 'REPO_PATH'
      if repo_path == vim.NIL then
        repo_path = ''
      end

      local dirs = {
        { name = 'Wiki', path = vim.fn.expand '~/vimwiki' },
        { name = 'Neovim Config', path = vim.fn.stdpath 'config' },
        { name = 'Home', path = vim.fn.expand '~' },
      }

      -- Add repos directory if it exists
      if repo_path ~= '' and vim.fn.isdirectory(repo_path) == 1 then
        table.insert(dirs, { name = 'Repos', path = repo_path })

        -- Add subdirectories from repos
        local handle = vim.loop.fs_scandir(repo_path)
        if handle then
          while true do
            local name, type = vim.loop.fs_scandir_next(handle)
            if not name then
              break
            end

            if type == 'directory' then
              local subdir_path = repo_path .. '/' .. name
              table.insert(dirs, {
                name = name,
                path = subdir_path,
              })
            end
          end
        end
      end

      pickers
        .new({}, {
          prompt_title = 'Change Directory',
          finder = finders.new_table {
            results = dirs,
            entry_maker = function(entry)
              return {
                value = entry.path,
                display = entry.name .. ' (' .. entry.path .. ')',
                ordinal = entry.name,
              }
            end,
          },
          sorter = conf.generic_sorter {},
          attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              vim.cmd('cd ' .. selection.value)
              print('Changed to: ' .. vim.fn.getcwd())
            end)
            return true
          end,
        })
        :find()
    end

    vim.keymap.set('n', '<leader>cd', cd_picker, { desc = '[C]hange [D]irectory' })
  end,
}
