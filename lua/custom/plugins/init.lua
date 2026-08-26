return {
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  {
    'barrett-ruth/live-server.nvim',
    build = 'npm install -g live-server',
    config = function()
      require('live-server').setup()
    end,
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    keys = {
      { '<leader>ls', '<cmd>LiveServerStart<cr>', desc = 'LiveServer Start' },
      { '<leader>lc', '<cmd>LiveServerStop<cr>', desc = 'LiveServer Stop' },
    },
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    enable_close = true,
    enable_rename = true,
    filetypes = { 'html', 'jsx', 'tsx' },
  },

  {
    'captbaritone/better-indent-support-for-php-with-html',
  },

  {
    'ojroques/vim-oscyank',
  },

  {
    'kkoomen/vim-doge',
    build = ':call doge#install()',
  },

  {
    'tpope/vim-fugitive',
  },

  {
    'mbbill/undotree',
  },

  {
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {}
    end,
  },

  {
    'mattn/emmet-vim',
    ft = {
      'html',
      'css',
      'javascriptreact',
      'typescriptreact',
    },
    init = function()
      vim.g.user_emmet_mode = 'n'
      vim.g.user_emmet_leader_key = '<C-y>'
    end,
  },

  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = { 'LazyGit' },
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'Open LazyGit' },
    },
  },

  -- Go
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    ft = { 'go', 'gomod' },
    opts = {
      lsp_codelens = false,
    },
    build = ':lua require("go.install").update_all_sync()',
  },

  -- Go debugger
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'leoluz/nvim-dap-go',
        opts = {},
      },
    },
  },
}
