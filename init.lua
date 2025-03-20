-- Basic settings
vim.g.neovide_cursor_animation_length = 0
vim.o.termguicolors = true
vim.o.number = true -- Enable line numbering
vim.o.relativenumber = true -- Enable relative line numbering
vim.o.hlsearch = false -- Disable highlight on search
vim.o.errorbells = false -- Disable error bells
vim.o.wrap = false -- Disable line wrapping
vim.o.swapfile = false -- Disable swap file
vim.o.backup = false -- Disable backup file
vim.o.undodir = vim.fn.stdpath("config") .. "/undodir" -- Set undo directory
vim.o.undofile = true -- Enable persistent undo
vim.o.incsearch = true -- Enable incremental search
vim.o.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
vim.o.updatetime = 300 -- Faster completion
vim.o.clipboard = "unnamedplus" -- Use system clipboard

-- Enable mouse support
vim.o.mouse = "a"
-- Configure tab and indent settings
vim.o.expandtab = false -- Convert tabs to spaces
vim.o.tabstop = 4 -- Insert 4 spaces for a tab
vim.o.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.o.smartindent = true -- Smart autoindenting on new lines

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- REMAPS
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Space>", "<NOP>", { noremap = true, silent = true })

-- Move lines up and down
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Keep cursor centered
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Bind <leader>E to open netrw file explorer
vim.api.nvim_set_keymap("n", "<leader>E", ":Explore<CR>", { noremap = true, silent = true })
-- Toggle neo-tree with <leader>e
vim.api.nvim_set_keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- OTHER
-- Open file in a text by placing text and gf
vim.api.nvim_set_keymap("n", "gf", ":vert wincmd f<CR>", { noremap = true, silent = true })

-- Copy filepath to clipboard by pressing yf
vim.api.nvim_set_keymap(
	"n",
	"yf",
	':lua vim.fn.setreg("+", vim.fn.expand("%:p"))<CR>',
	{ noremap = true, silent = true }
)

-- Copy pwd to clipboard by pressing yd
vim.api.nvim_set_keymap(
	"n",
	"yd",
	':lua vim.fn.setreg("+", vim.fn.expand("%:p:h"))<CR>',
	{ noremap = true, silent = true }
)

-- Jump to the last position when reopening a file
vim.cmd([[
  if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal! g'\"" | endif
  endif
]])
