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
        chunks = "all", -- completion in all chunks
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
        default_method = "molten", -- use molten since you already have it!
      },
    },
    keys = {
      { "<leader>qp", "<cmd>QuartoPreview<cr>", desc = "Quarto Preview" },
      { "<leader>qc", "<cmd>QuartoClosePreview<cr>", desc = "Quarto Close Preview" },
      { "<leader>qa", "<cmd>QuartoActivate<cr>", desc = "Quarto Activate" },
    },
  },
  {
    "jmbuhr/otter.nvim",
    opts = {},
  },
}
