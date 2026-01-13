-- tabs & indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true

-- appearance
vim.o.number = true
-- vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.inccommand = "split" -- preview substitutions
vim.o.signcolumn = "yes" -- always keep the sign column on
vim.o.winborder = "rounded"

-- editor
vim.o.breakindent = true
vim.o.list = true -- enable whitespace characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- whitespace characters

-- split windows
vim.o.splitright = true
vim.o.splitbelow = true

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- use system clipcoatd as default register
vim.opt.clipboard:append("unnamedplus")

-- save undo history
vim.o.undofile = true

-- misc
vim.o.updatetime = 250 -- decrease update time
vim.o.timeoutlen = 300 -- decrease mapped sequence wait time
vim.o.confirm = true -- raise confirmation dialog on failed operation
vim.o.mouse = "a" -- enable mouse mode
