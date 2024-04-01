
-- While typing a search command, show where the pattern matches. The matched
-- string is highlighted. You can use the CTRL-G and CTRL-T keys to move to the
-- next and previous match.
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- If you don't want to turn 'hlsearch' on, but want to highlight all matches
-- while searching, you can turn on and off 'hlsearch' with autocmd.
local hlsearch_group = vim.api.nvim_create_augroup(
  -- Clear existing commands if the group already exists ('autocmd!').
  "titan-highlight-incsearch", {
    clear = true,
  }
)

local function set_incsearch_highlight(event, value)
  vim.api.nvim_create_autocmd(
    event, {
      pattern = "/,?",
      group = hlsearch_group,
      callback = function()
        -- Only set the value local to the current buffer or window.
        vim.opt_local.hlsearch = value
      end,
    }
  )
end

set_incsearch_highlight("CmdlineEnter", true)
set_incsearch_highlight("CmdlineLeave", false)

-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd(
  "TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup(
      "titan-highlight-yank", {
        clear = true,
      }
    ),
    callback = function()
      vim.highlight.on_yank()
    end,
  }
)

-- "formatoptions" (":help 'fo') is an option to influence how Vim formats text.
-- "=vim.opt.formatoptions:get()" shows us the default options as "cjloqr" where
-- the options "o" (":help fo-o") is bothering us because it inserts a comment
-- after hitting "o" or "O" in normal mode.
vim.api.nvim_create_autocmd(
  -- If "FileType" does not work use "BufEnter" instead since other plugins can
  -- set "formatoptions" (apparently for forums).
  "FileType", {
    pattern = "*", -- So far all file types.
    group = vim.api.nvim_create_augroup(
      "titan-formatoptions-remove", {
        clear = true,
      }
    ),
    callback = function()
      local formatoptions = vim.opt.formatoptions:get()
      formatoptions.o = false -- Disable annoying option.
      vim.opt_local.formatoptions = formatoptions
    end,
  }
)

