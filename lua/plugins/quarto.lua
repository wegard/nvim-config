-- lua/plugins/quarto.lua
return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim", -- LSP features in code chunks
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "quarto", "markdown" },
    opts = {
      lspFeatures = {
        enabled = true,
        languages = { "python", "r", "julia" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = {
          enabled = true,
        },
      },
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    },
    keys = {
      { "<leader>qp", "<cmd>QuartoPreview<cr>",      desc = "Quarto Preview" },
      { "<leader>qc", "<cmd>QuartoClosePreview<cr>", desc = "Quarto Close Preview" },
      { "<leader>qa", "<cmd>QuartoActivate<cr>",     desc = "Quarto Activate" },

      -- Cell runner (routes to molten via codeRunner.default_method)
      { "<localleader>rc", function() require("quarto.runner").run_cell() end,    desc = "Run cell" },
      { "<localleader>ra", function() require("quarto.runner").run_above() end,   desc = "Run cell + above" },
      { "<localleader>rA", function() require("quarto.runner").run_all() end,     desc = "Run all cells" },
      { "<localleader>rl", function() require("quarto.runner").run_line() end,    desc = "Run line" },
      { "<localleader>r",  function() require("quarto.runner").run_range() end,   desc = "Run visual range", mode = "v" },
      { "<localleader>RA", function() require("quarto.runner").run_all(true) end, desc = "Run all (all langs)" },

      -- Insert empty python cells
      {
        "<localleader>cc",
        function()
          local row = vim.api.nvim_win_get_cursor(0)[1]
          vim.api.nvim_buf_set_lines(0, row, row, false, { "", "```{python}", "", "```", "" })
          vim.api.nvim_win_set_cursor(0, { row + 3, 0 })
          vim.cmd("startinsert")
        end,
        desc = "Insert python cell below",
      },
      {
        "<localleader>cC",
        function()
          local row = vim.api.nvim_win_get_cursor(0)[1]
          vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { "", "```{python}", "", "```", "" })
          vim.api.nvim_win_set_cursor(0, { row + 2, 0 })
          vim.cmd("startinsert")
        end,
        desc = "Insert python cell above",
      },

      -- Cell navigation
      {
        "<localleader>ce",
        function()
          vim.fn.search("^```$", "W")
          vim.cmd("normal! k")
        end,
        desc = "Jump to last line of cell",
      },
      {
        "<localleader>cb",
        function()
          vim.fn.search("^```{", "bW")
          vim.cmd("normal! j")
        end,
        desc = "Jump to first line of cell",
      },
      { "]j", function() vim.fn.search("^```{", "W")  end, desc = "Next cell" },
      { "[j", function() vim.fn.search("^```{", "bW") end, desc = "Prev cell" },
    },
  },
  {
    "jmbuhr/otter.nvim",
    opts = {},
  },
}
