require 'keymaps'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.api.nvim_exec('autocmd VimEnter * startinsert', false)
-- vim.api.nvim_exec2('autocmd BufNewFile *.sh 0r ~/skeletons/bash.sh',false)
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.sh",
  command = "0r ~/skeletons/bash.sh",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  command = "setlocal omnifunc=htmlcomplete#CompleteTags",
})

-- Install lua package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'm4xshen/hardtime.nvim',
    -- event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    opts = {
      disabled_keys = {
        ["<Up>"] = { "n" },
        ["<Down>"] = { "n" },
        ["<Left>"] = { "n" },
        ["<Right>"] = { "n" },
      },
    },
  },
  {
    'GrzegorzKozub/ahk.nvim',
    cond = vim.fn.has 'win32' == 1,
    opts = { interpreter = 'AutoHotkey64.exe' },
  },

  {
    "ggandor/leap.nvim",
    event = "BufEnter",
  },
  { 'glacambre/firenvim',   build = ":call firenvim#install(0)" },
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      watch_for_changes = true,
      skip_confirm_for_simple_edits = true,

      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,

      }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },

  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,      -- default settings
    submodules = false, -- not needed, submodules are required only for tests
  },
  {
    "tpope/vim-speeddating"
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      popupmenu = {
        enabled = false,
      },
      routes = {
        {
          view = "notify",
          -- filter = { event = "msg_showmode" },
          filter = {
            event = "msg_show",
            kind = "",
            find = "INSERT",
          },
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  -- {
  --   'tris203/precognition.nvim',
  --   event = 'VeryLazy',
  --   config = {
  --     -- startVisible = true,
  --     -- showBlankVirtLine = true,
  --     -- highlightColor = { link = "Comment" },
  --     -- hints = {
  --     --      Caret = { text = "^", prio = 2 },
  --     --      Dollar = { text = "$", prio = 1 },
  --     --      MatchingPair = { text = "%", prio = 5 },
  --     --      Zero = { text = "0", prio = 1 },
  --     --      w = { text = "w", prio = 10 },
  --     --      b = { text = "b", prio = 9 },
  --     --      e = { text = "e", prio = 8 },
  --     --      W = { text = "W", prio = 7 },
  --     --      B = { text = "B", prio = 6 },
  --     --      E = { text = "E", prio = 5 },
  --     -- },
  --     -- gutterHints = {
  --     --     G = { text = "G", prio = 10 },
  --     --     gg = { text = "gg", prio = 9 },
  --     --     PrevParagraph = { text = "{", prio = 8 },
  --     --     NextParagraph = { text = "}", prio = 8 },
  --     -- },
  --   },
  -- },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },
  -- Auto Format
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },
  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',  opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  { import = 'custom.plugins' },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- :NOTE Abbreviations
vim.cmd('abbreviate ak Ajay Krishna R')
vim.cmd('abbreviate hw Hello World!')
vim.cmd(
  'abbreviate lor Lorem ipsum odor amet, consectetuer adipiscing elit. Penatibus aenean senectus sapien nostra, luctus ex feugiat. Bibendum sem gravida consectetur non tristique. Scelerisque pharetra sapien mattis finibus nulla. Egestas natoque non laoreet, fermentum pharetra faucibus. Ex nascetur enim eget tristique justo hac finibus a. Phasellus fermentum quis tristique justo nascetur consectetur adipiscing facilisis aliquet. Suspendisse vestibulum penatibus nam quam quisque malesuada.')

-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
vim.opt.foldcolumn = "2"
vim.opt.foldopen = "all"
vim.opt.foldclose = "all"

vim.opt.shell = 'pwsh'
vim.opt.shellcmdflag = '-nologo -noprofile -ExecutionPolicy RemoteSigned -command'
vim.opt.shellxquote = ''

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.history = 10000
-- vim.o.cul = true
-- vim.o.cuc = true
-- vim.o.crb = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'
-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.opt.tabstop = 2
vim.opt.showmatch = true
vim.opt.cul = true
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.undodir = vim.fn.expand '~/.vim/undodir'
vim.opt.undofile = true
vim.wo.relativenumber = true
vim.opt.spell = true
vim.opt.splitright = true

vim.keymap.set('n', 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n' }, '<Leader>s', '<cmd>luafile %<CR>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim.api.nvim_create_autocmd('NoCommentNewLine',{
-- --
-- })

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    file_ignore_patterns = { '^./.git/', '^node_modules/', '^vendor/', '%.jpg', '%.png' },
  },
}
local builtin = require 'telescope.builtin'

-- Enable telescope fzf native, if installed
pcall(builtin.load_extension, 'fzf')
-- See `:help telescope.builtin`
pcall(builtin.load_extension, 'ui-select')
-- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
--vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })


-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fb', builtin.builtin)
vim.keymap.set('n', '<leader>lg', builtin.live_grep)
vim.keymap.set('n', '<leader>sb', builtin.buffers)
-- vim.keymap.set('n', '<leader>fb', builtin.file_browser)
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>hs', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>ws', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>ds', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>cs', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })

-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
--
-- vim.keymap.set('n', '<leader>sn', function()
--   require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
-- end, { desc = '[S]earch [N]eovim files' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  'bashls',
  'luau_lsp',
  'marksman',
  'powershell_es',
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'cmp_cmdline' },
    { name = 'luasnip' },
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
---
-- Titus Custom Markdown HUGO Image Insert
---
require('clipboard-image').setup {
  markdown = {
    img_dir = { 'content/images', '%:p:h:t', '%:t:r' },
    img_dir_txt = { '/images', '%:p:h:t', '%:t:r' },
    img_name = function()
      vim.fn.inputsave()
      local name = vim.fn.input 'Name: '
      vim.fn.inputrestore()

      if name == nil or name == '' then
        return os.date '%y-%m-%d-%H-%M-%S'
      end
      return name
    end,
  },
}

-- Useful for easily creating commands
local z_utils = require 'telescope._extensions.zoxide.utils'

require('telescope').setup {
  -- (other Telescope configuration...)
  extensions = {
    zoxide = {
      prompt_title = '[ Walking on the shoulders of TJ ]',
      mappings = {
        default = {
          after_action = function(selection)
            print('Update to (' .. selection.z_score .. ') ' .. selection.path)
          end,
        },
        ['<C-s>'] = {
          before_action = function(selection)
            print 'before C-s'
          end,
          action = function(selection)
            vim.cmd.edit(selection.path)
          end,
        },
        -- Opens the selected entry in a new split
        ['<C-q>'] = { action = z_utils.create_basic_command 'split' },
      },
    },
  },
}



-- require('synthwave84').setup {
--   glow = {
--     error_msg = true,
--     type2 = true,
--     func = true,
--     keyword = true,
--     operator = false,
--     buffer_current_target = true,
--     buffer_visible_target = true,
--     buffer_inactive_target = true,
--   },
-- }
--
-- vim.cmd [[colorscheme synthwave84]]
