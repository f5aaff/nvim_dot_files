return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        integrations = {
          native_lsp = {
            enabled = true,
          },
          semantic_tokens = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
      -- Base variable
      vim.api.nvim_set_hl(0, "@lsp.type.variable.go", { fg = "#cba6f7" })

      -- Stronger overrides (these actually win)
      vim.api.nvim_set_hl(0, "@lsp.typemod.variable.definition.go", { fg = "#cba6f7", bold = true })
      vim.api.nvim_set_hl(0, "@lsp.typemod.variable.pointer.go", { fg = "#fab387" })

      -- Other types
      vim.api.nvim_set_hl(0, "@lsp.type.parameter.go", { fg = "#f5c2e7" })
      vim.api.nvim_set_hl(0, "@lsp.type.function.go", { fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "@lsp.type.method.go", { fg = "#74c7ec" })
      vim.api.nvim_set_hl(0, "@lsp.type.struct.go", { fg = "#f9e2af" })
    end,
  },


  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    require("lualine").setup({
      options = {
        theme = require("catppuccin.utils.lualine")(),
      },
    })
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },

}
