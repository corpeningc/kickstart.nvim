# My Neovim Configuration

A modular, well-organized Neovim configuration built on Kickstart.nvim foundations.

## Structure

```
nvim/
├── init.lua                    # Bootstrap and plugin loading
├── lua/
│   ├── config/
│   │   ├── options.lua         # Neovim options and settings
│   │   ├── keymaps.lua         # Keybindings
│   │   └── autocmds.lua        # Autocommands
│   └── plugins/
│       ├── lsp.lua             # LSP configuration
│       ├── completion.lua      # Blink.cmp configuration
│       ├── treesitter.lua      # Treesitter configuration
│       ├── conform.lua         # Formatting configuration
│       ├── telescope.lua       # Fuzzy finder
│       ├── colorscheme.lua     # Color schemes
│       ├── which-key.lua       # Keybinding hints
│       ├── comment.lua         # Commenting utilities
│       ├── mini.lua            # Mini.nvim modules
│       ├── debug.lua           # DAP debugging
│       ├── neo-tree.lua        # File explorer
│       └── ... (other plugins)
```

## Installation

### Requirements

- Neovim >= 0.10 (nightly or stable)
- Git
- A C compiler (gcc, clang, or MSVC)
- [ripgrep](https://github.com/BurntSushi/ripgrep) - For Telescope live grep
- [fd](https://github.com/sharkdp/fd) - For Telescope file finding
- Node.js & npm - For TypeScript/JavaScript LSP servers
- (Optional) A [Nerd Font](https://www.nerdfonts.com/) for icons

### Windows Installation

```powershell
# Clone this repository
git clone github.com/corpeningc/kickstart.nvim "$env:LOCALAPPDATA\nvim"

# Start Neovim (plugins will auto-install)
nvim
```

### Linux/macOS Installation

```bash
# Clone this repository
git clone github.com/corpeningc/kickstart.nvim ~/.config/nvim

# Start Neovim (plugins will auto-install)
nvim
```

### Post Installation

1. Open Neovim - Lazy.nvim will automatically install all plugins
2. Run `:checkhealth` to verify everything is working
3. Run `:Mason` to install additional language servers

## Key Features

### Language Support

Configured LSP servers:
- **Lua** - lua_ls
- **TypeScript/JavaScript** - ts_ls with Vue support
- **Go** - gopls with golangci-lint
- **C#** - Roslyn
- **Vue** - Vetur/Vue Language Server

## Credits

Built upon [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - A fantastic starting point for Neovim configurations.
