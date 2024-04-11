
-- https://neovim.io/doc/user/map.html
-- See :map, :nmap, :vmap, :imap to view current mappings.

-- :help map-modes
-- :help mapmode-x activated only in visual mode
-- :help mapmode-s activated only in select mode
-- :help mapmode-v activated in both visual and select mode
-- :help Visual-mode
-- :help Select-mode

-- gv gV gn gN g; g, gi ga g8 gx
-- :history / <C-f>

vim.g.mapleader = " " -- ,
vim.g.maplocalleader = " "

vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set({"n", "v"}, "c", [["_c]]) -- <leader>c

vim.keymap.set({"n", "x", "o"}, "<leader>h", "^") -- g0
vim.keymap.set({"n", "x", "o"}, "<leader>l", "g_") -- g$
vim.keymap.set({"n", "x", "o"}, "<leader><space>", "|") -- gm gM

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set({"n", "v"}, "<leader>P", [["+P]])

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>b", "<cmd>buffers<cr>:buffer<Space>")

vim.keymap.set(
  {"n", "v"}, "<leader>s",
  function()
    vim.opt_local.hlsearch = not(
      vim.opt_local.hlsearch:get()
    )
  end
)

-- Keybinds to make split navigation easier (see ":help wincmd").
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

