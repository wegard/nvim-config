-- LaTeX formatting shortcuts (gz prefix)
-- Normal mode: applies to word under cursor
vim.keymap.set("n", "gzb", 'ciw\\textbf{<C-r>"}<Esc>', { desc = "LaTeX bold word", buffer = true })
vim.keymap.set("n", "gzi", 'ciw\\emph{<C-r>"}<Esc>', { desc = "LaTeX emph word", buffer = true })
vim.keymap.set("n", "gzu", 'ciw\\underline{<C-r>"}<Esc>', { desc = "LaTeX underline word", buffer = true })
vim.keymap.set("n", "gzt", 'ciw\\texttt{<C-r>"}<Esc>', { desc = "LaTeX monospace word", buffer = true })

-- Visual mode: select text first, then apply
vim.keymap.set("v", "gzb", 'c\\textbf{<C-r>"}<Esc>', { desc = "LaTeX bold", buffer = true })
vim.keymap.set("v", "gzi", 'c\\emph{<C-r>"}<Esc>', { desc = "LaTeX emph", buffer = true })
vim.keymap.set("v", "gzu", 'c\\underline{<C-r>"}<Esc>', { desc = "LaTeX underline", buffer = true })
vim.keymap.set("v", "gzt", 'c\\texttt{<C-r>"}<Esc>', { desc = "LaTeX monospace", buffer = true })
