return {
  {
    "lervag/vimtex",
    opts = function(_, opts)
      -- Use Zathura as the viewer
      vim.g.vimtex_view_method = "zathura"
      -- Configure Tectonic as the compiler
      vim.g.vimtex_compiler_method = "tectonic"
      -- Optional: Tectonic does not output the same log files as pdflatex.
      -- If you find error parsing issues, you might need to adjust flags,
      -- but the default usually works well for basic use.
    end,
  },
}
