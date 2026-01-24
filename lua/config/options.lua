local home = vim.fn.expand("~") -- Gets "/home/vegard" or "/Users/vegard"

-- 1. Determine the Mamba/Micromamba location based on OS
local mamba_root
if jit.os == "Linux" then
  -- Your specific Linux path
  mamba_root = home .. "/.local/share/mamba"
elseif jit.os == "OSX" then
  -- The standard Mac path for Micromamba (VERIFY THIS on your Mac!)
  mamba_root = home .. "/micromamba"
else
  mamba_root = home .. "/micromamba"
end

-- 2. Construct the path to your 'nvim-sys' environment
-- This results in: .../envs/nvim-sys/bin/python
local python_bin = mamba_root .. "/envs/nvim-sys/bin/python"

-- 3. Set the Python provider
vim.g.python3_host_prog = python_bin

-- 4. Help Jupyter/Molten find kernels
-- This ensures they look inside your nvim-sys environment
vim.env.JUPYTER_PATH = home .. "/.local/share/jupyter:" .. mamba_root .. "/envs/nvim-sys/share/jupyter"
vim.env.JUPYTER_DATA_DIR = home .. "/.local/share/jupyter"

-- 5. Update system PATH for this session
-- This lets Neovim run 'jupytext' or 'python' directly from your env
vim.env.PATH = mamba_root .. "/envs/nvim-sys/bin:" .. vim.env.PATH

-- 6. Spell settings
vim.opt.spelllang = { "en", "nb" }
