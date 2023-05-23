return {
  {
    'williamboman/mason.nvim',
    cmd = "Mason",
    config = function() require 'mason'.setup() end
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require 'lspconfig'
      vim.diagnostic.config({
        virtual_text = false,
      })

      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end


      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "open diagnostic" })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "prev diagnostic" })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "next diagnostic" })
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "setloclist" })

      local on_attach = function(client, bufnr)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = "declaration" })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "definition" })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "hover" })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = "implementation" })
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>ld', "<cmd>Telescope diagnostics<cr>", { buffer = bufnr, desc = "all diagnostics" })
        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.type_definition, { buffer = bufnr, desc = "type definition" })
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { buffer = bufnr, desc = "rename" })
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { buffer = bufnr, desc = "code actions" })
        vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references, { buffer = bufnr, desc = "references" })
        vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end,
          { buffer = bufnr, desc = "format" })
      end

      local flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
      }

      local settings = {
        haskell = {
          formattingProvider = "fourmolu",
        },
      }

      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      for _, lsp in pairs(require 'mason-lspconfig'.get_installed_servers()) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          flags = flags,
          capabilities = capabilities,
          settings = settings,
        }
      end
    end
  },

}
