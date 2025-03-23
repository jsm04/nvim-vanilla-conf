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

-- Netrw
vim.g.netrw_sort_by = "name" -- Sort files by name (can change to 'time' or 'size')
vim.g.netrw_show_hidden = 1 -- Show hidden files (e.g., .git, .vimrc)
vim.g.netrw_browse_split = 3 -- Open in a new tab (use 2 for horizontal split, 3 for vertical split)
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

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
vim.api.nvim_set_keymap("n", "<leader>e", ":Explore<CR>", { noremap = true, silent = true })

-- Map Ctrl+w n to go to the next tab
vim.api.nvim_set_keymap("n", "<C-w>n", ":tabnext<CR>", { noremap = true, silent = true })

-- Map Ctrl+w p to go to the previous tab
vim.api.nvim_set_keymap("n", "<C-w>p", ":tabprev<CR>", { noremap = true, silent = true })

-- Map Leader + q to :q
vim.api.nvim_set_keymap("n", "<Leader>q", ":q<CR>", { noremap = true, silent = true })

-- Map Leader + w to :w
vim.api.nvim_set_keymap("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })

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

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Resize windows
vim.keymap.set("n", "<C-M-h>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-l>", ":vertical resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-j>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-M-k>", ":resize +2<CR>", { noremap = true, silent = true })

-- Buffer
vim.keymap.set("n", "<Leader>bd", ":bd<CR>", { noremap = true, silent = true })
-- Close buffer without closing the window
vim.keymap.set("n", "<Leader>bD", ":bp | bd #<CR>", { noremap = true, silent = true })
