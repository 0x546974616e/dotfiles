
-- Changing tree top *:Ntree [dirname]* *netrw-gn*.
-- Toggle banner display *netrw-I*.

-- Suppress the banner.
-- ( Remember:
--   - "-": go up dir
--   - "D": delete
--   - "R": rename
--   - "s": sort-by
--   - "x": special
--   - "%": new file
--   - "d": new directory
-- )
vim.g.netrw_banner = 0

-- Set the default listing style:
--   0. Thin listing (one file per line)
--   1. Long listing (one file per line with time stamp information and file size)
--   2. Wide listing (multiple files in columns)
--   3. Tree style listing
vim.g.netrw_liststyle = 3

-- Open files in split
--   0. Re-use the same window (default).
--   1. Horizontally splitting the window first.
--   2. Vertically splitting the window first.
--   3. Open file in new tab.
--   4. Act like "P" (ie. open previous window).
vim.g.netrw_browse_split = 0

-- Show hidden files
--   0. Show all files.
--   1. Show not-hidden files.
--   2. Show hidden files only.
vim.g.netrw_hide = 1
vim.g.netrw_list_hide = "\\~$"

-- Vertical window width.
vim.g.netrw_winsize = 25

-- Set relative numbers.
vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = "netrw",
    group = vim.api.nvim_create_augroup(
      "titan-netrw-numbers", {
        clear = true,
      }
    ),
    callback = function()
      vim.opt_local.number = true
      vim.opt_local.relativenumber = true
    end,
  }
)

-- Keep the current directory and the browsing directory synced.
-- This helps you avoid the move files error.
vim.g.netrw_keepdir = 0

-- Human-readable files sizes.
-- (see Listing Style *netrw-i* and Information About File *netrw-qf*).
vim.g.netrw_sizestyle = "H"

-- TODO

-- Highlight marked files in the same way search matches are.
vim.cmd("highlight! link netrwMarkFile Search")

