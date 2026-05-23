-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- =============================================================================
-- Shell & Claude Code prompt buffers
-- Configures Neovim when it's invoked as $EDITOR from:
--   * zsh vi mode `edit-command-line` widget (Esc v in NORMAL mode)
--   * Claude Code's external editor (Ctrl+G)
-- Works on both Gentoo (/tmp/zsh*) and macOS (/var/folders/.../zsh*).
-- =============================================================================

local aug = vim.api.nvim_create_augroup("user_shell_prompt_buffers", { clear = true })

-- ---------------------------------------------------------------------------
-- zsh edit-command-line buffer
-- ---------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = aug,
  pattern = { "*/zsh*", "*/zshecl*" },
  callback = function(ev)
    vim.bo[ev.buf].filetype = "zsh"
    vim.wo.wrap = true
    vim.wo.linebreak = true

    -- <CR> in NORMAL mode: save and return command to shell
    vim.keymap.set("n", "<CR>", "<cmd>wq<CR>",
      { buffer = ev.buf, silent = true, desc = "Save & return to shell" })

    -- q in NORMAL mode: discard (shell will not execute anything)
    vim.keymap.set("n", "q", "<cmd>cq<CR>",
      { buffer = ev.buf, silent = true, desc = "Discard (abort command)" })
  end,
})

-- ---------------------------------------------------------------------------
-- Claude Code prompt buffer
-- ---------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = aug,
  pattern = { "*claude-prompt*", "*/claude/*", "*/.claude/*" },
  callback = function(ev)
    vim.bo[ev.buf].filetype = "markdown"
    vim.wo.wrap = true
    vim.wo.linebreak = true
    vim.wo.spell = true
    vim.bo[ev.buf].spelllang = "en_us"

    -- <CR> in NORMAL mode: save and send prompt to Claude Code
    vim.keymap.set("n", "<CR>", "<cmd>wq<CR>",
      { buffer = ev.buf, silent = true, desc = "Send prompt to Claude Code" })

    -- q in NORMAL mode: discard prompt (returns to Claude Code with nothing)
    vim.keymap.set("n", "q", "<cmd>cq<CR>",
      { buffer = ev.buf, silent = true, desc = "Discard prompt" })
  end,
})
