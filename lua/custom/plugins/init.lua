-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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
  { -- This helps with php/html for indentation
    'captbaritone/better-indent-support-for-php-with-html',
  },
  { -- This helps with ssh tunneling and copying to clipboard
    'ojroques/vim-oscyank',
  },
  { -- This generates docblocks
    'kkoomen/vim-doge',
    build = ':call doge#install()',
  },
  { -- Git plugin
    'tpope/vim-fugitive',
  },
  { -- Show historical versions of the file locally
    'mbbill/undotree',
  },
  { -- Show CSS Colors
    'brenoprata10/nvim-highlight-colors',
    config = function()
      require('nvim-highlight-colors').setup {}
    end,
  },
  {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'javascriptreact', 'typescriptreact' }, -- Load only for these filetypes
    init = function()
      vim.g.user_emmet_mode = 'n' -- Normal + Insert mode
      vim.g.user_emmet_leader_key = '<C-y>' -- Trigger key
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
  {
    'ray-x/go.nvim',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
    config = function(_, opts)
      require('go').setup(opts)
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              staticcheck = true,
              semanticTokens = true,
            },
          },
        },
        golangci_lint_ls = {},
      },
      setup = {
        gopls = function(_, _)
          local lsp_utils = require 'base.lsp.utils'
          lsp_utils.on_attach(function(client, bufnr)
            local map = function(mode, lhs, rhs, desc)
              if desc then
                desc = desc
              end
              vim.keymap.set(
                mode,
                lhs,
                rhs,
                { silent = true, desc = desc, buffer = bufnr, noremap = true }
              )
            end
            -- stylua: ignore
            if client.name == "gopls" then
              map("n", "<leader>ly", "<cmd>GoModTidy<cr>", "Go Mod Tidy")
              map("n", "<leader>lc", "<cmd>GoCoverage<Cr>", "Go Test Coverage")
              map("n", "<leader>lt", "<cmd>GoTest<Cr>", "Go Test")
              map("n", "<leader>lR", "<cmd>GoRun<Cr>", "Go Run")
              map("n", "<leader>dT", "<cmd>lua require('dap-go').debug_test()<cr>", "Go Debug Test")
            end
          end)
        end,
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = { 'leoluz/nvim-dap-go', opts = {} },
  },
}
