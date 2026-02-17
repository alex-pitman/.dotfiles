-- Tabs & Indentation Settings
vim.o.autoindent = true -- take indent for new line from previous line
vim.o.breakindent = true -- wrapped line repeats indent
vim.o.expandtab = true -- use spaces when <Tab> is inserted
vim.o.shiftwidth = 2 -- number of spaces to use for (auto)indent step
vim.o.softtabstop = 2 -- number of spaces that <Tab> uses while editing
vim.o.tabstop = 2 -- number of spaces that <Tab> in file uses

-- Appearance settings
vim.o.number = true -- print the line number in front of each line
vim.o.relativenumber = true -- show relative line number in front of each line
vim.o.cursorline = true -- highlight the screen line of the cursor
vim.o.inccommand = "split" -- preview substitutions
vim.o.signcolumn = "yes" -- always show the sign column
vim.o.winborder = "rounded" -- border style for floating windows
vim.o.colorcolumn = "120"

-- Editor settings
vim.o.list = true -- enable whitespace characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- whitespace characters
vim.o.scrolloff = 10 -- number of lines to keep above/below cursor
vim.o.sidescrolloff = 8 -- number of columns to keep to the left/right of the cursor

-- split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- use system clipboard as default register
vim.opt.clipboard:append("unnamedplus")

-- save undo history
vim.o.undofile = true

-- misc
vim.o.updatetime = 250 -- decrease update time
vim.o.timeoutlen = 300 -- decrease mapped sequence wait time
vim.o.confirm = true -- raise confirmation dialog on failed operation
vim.o.mouse = "a" -- enable mouse mode
