return {

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
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
