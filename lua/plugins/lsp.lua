return {

  -------------------------------------------------
  -- LSP
  -------------------------------------------------

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()

      local cmp = require("cmp")

      cmp.setup({
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        },

        sources = {
          { name = "nvim_lsp" },
        },
      })

      -------------------------------------------------
      -- capabilities
      -------------------------------------------------

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -------------------------------------------------
      -- diagnostics
      -------------------------------------------------

      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.HINT] = "H",
            [vim.diagnostic.severity.INFO] = "I",
          },
        },
      })

      -------------------------------------------------
      -- keymaps
      -------------------------------------------------

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "<leader>gws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>gca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>grr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, opts)

        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
        vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
      end

      -------------------------------------------------
      -- servers
      -------------------------------------------------

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("pylsp", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = { enabled = false },
              pyflakes = { enabled = false },
              mccabe = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              pylint = { enabled = false },

              rope_completion = { enabled = true },
              jedi = { enabled = true },
            },
          },
        },
      })

      -------------------------------------------------
      -- enable servers
      -------------------------------------------------

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("pylsp")

    end,
  },

}
