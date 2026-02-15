-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--

local builtin = require 'telescope.builtin'

vim.opt.relativenumber = true -- relative line numbers

vim.keymap.set("n", "<C-w>", "<cmd> wq<CR>", {silent=true})
vim.keymap.set("n", "<C-q>", "<cmd> q!<CR>", {silent=true})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {silent=true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {silent=true})
vim.keymap.set("n", "n", "nzz", {silent=true})
vim.keymap.set("n", "N", "Nzz", {silent=true})
vim.keymap.set("n", "<C-k>", "<cmd> m .-2<CR>", {silent=true})
vim.keymap.set("n", "<C-j>", "<cmd> m .+1<CR>", {silent=true})
vim.keymap.set('n', 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
vim.keymap.set({ 'x', 'o' }, 's', '<Plug>(leap-forward)')
vim.keymap.set({ 'x', 'o' }, 'S', '<Plug>(leap-backward)')
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>sb', builtin.builtin)
vim.keymap.set('n', '<leader>lg', builtin.live_grep)
vim.keymap.set('n', '<leader>sb', builtin.buffers)
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>hs', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>ws', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>ds', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>cs', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })


lvim.plugins = {
  { "Pocco81/auto-save.nvim" },
  { "farmergreg/vim-lastplace" },
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
  --   {
  --   "ggandor/leap.nvim",
  --   event = "BufEnter",
  -- },
-- {
--     'm4xshen/hardtime.nvim',
--     -- event = 'VeryLazy',
--     dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
--     opts = {
--       disabled_keys = {
--         ["<Up>"] = { "n" },
--         ["<Down>"] = { "n" },
--         ["<Left>"] = { "n" },
--         ["<Right>"] = { "n" },
--       },
--     },
--   },

-- lazy.nvim
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
}
}
