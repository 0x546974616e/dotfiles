
-- :che[ckhealth] Run all healthchecks.

-- Do no make Vim Vi-compatible.
-- (Nvim is always "nocompatible")
vim.opt.compatible = false

-- Enables mouse support.
-- (Default is "nvi", use "a" instead?)
vim.opt.mouse = "nvi"

-- (Nvim is always UTF-8)
vim.opt.encoding = "utf-8"

-- Vim will use the clipboard register "+" for all yank, delete, change and put
-- operations which would normally go to the unnamed register.
--
-- Here is what I have learned in the mean time: there are 2 main (actually 3,
-- but the third is somehow not used almost ever, called SECONDARY register)
-- system registers/clipboards on UNIX. There is:
--   - PRIMARY selection which essentially holds the value of the selected text
--     with a mouse and is pasted to applications by a middle click on a button.
--   - CLIPBOARD default which is essentially the one clipboard we all think of
--     when we hear the term.
vim.opt.clipboard = "unnamedplus"

-- Make a backup before overwriting a file.
vim.opt.backup = true

-- Always display the name of tabs.
vim.opt.showtabline = 2

-- The last window will always have a status line.
vim.opt.laststatus = 2

-- Show command in the last line if the screen.
vim.opt.showcmd = true

-- Try keeping the cursor on the same column.
vim.opt.startofline = false

-- Every wrapped line will continue visually indented (same amount of space as
-- the beginning of that line).
vim.opt.breakindent = true

-- Set relative numbers.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "81"
-- vim.opt.textwidth = 80

-- Set indent size.
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 4 -- 8

-- Setup column to display signs.
vim.opt.signcolumn = "number"
vim.opt.foldcolumn = "1"

-- Copy indent from current line when starting a new line (typing <CR>
-- in Insert mode or when using the "o" or "O" command).
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert mode.
-- Each item allows way to backspace over something:
--   1. Indent: allow backspacing over autoindent.
--   2. EOL: allow backspacing over line breaks (join lines).
--   3. Start: allow backspacing over the start of insert.
vim.opt.backspace = "2" -- "indent,eol,start"

-- Allow specified keys that move the cursor left/right to move to the
-- previous/next line when the cursor is on the first/last character in
-- the line.
--   1. "b" (<BS>) Normal and Visual
--   2. "s" (<Space>) Normal and Visual
--   3. "<" (<Left>) Normal and Visual
--   4. ">" (<Right>) Normal and Visual
--   5. "[" (<Left>) Insert and Replace
--   6. "]" (<Right>) Insert and Replace
vim.opt.whichwrap = "bs<>[]"

local dot = "·" -- \u00B7

vim.opt.list = true
vim.opt.listchars = {
  extends = '>',
  precedes = '<',
  tab = "<->", -- "| "
  multispace = dot,
  trail = dot,
  nbsp = "␣",
  lead = dot,
  -- lead = " ",
  -- leadmultispace = "╷" .. dot,
}

--[[
-- TODO:
" Typst
autocmd BufEnter *.typ syntax spell toplevel
autocmd BufEnter *.typ setlocal
  \ wrap textwidth=0 wrapmargin=0 linebreak
  \ spell spelllang+=fr complete+=kspell

ignorecase
smartcase
undofile
confirm
--]]

