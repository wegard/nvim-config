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

-- Generators (gz prefix) - These create environments and enter Insert mode
-- Itemize: Creates list, places cursor after \item
vim.keymap.set(
  "n",
  "gzl",
  "o\\begin{itemize}<CR>\\item <CR>\\end{itemize}<Esc>kA",
  { desc = "LaTeX itemize list", buffer = true }
)

-- Frame: Creates Beamer frame, places cursor inside first {}
vim.keymap.set("n", "gzf", "o\\begin{frame}{}<CR>\\end{frame}<Esc>k$i", { desc = "LaTeX beamer frame", buffer = true })

-- Graphic: Creates includegraphics, places cursor inside {}
vim.keymap.set(
  "n",
  "gzg",
  "o\\includegraphics[width=1.00\\textwidth]{}<Esc>i",
  { desc = "LaTeX includegraphics", buffer = true }
)

-- Center: Creates center env, places cursor on new line in middle
vim.keymap.set("n", "gzc", "o\\begin{center}<CR>\\end{center}<Esc>O", { desc = "LaTeX center", buffer = true })
