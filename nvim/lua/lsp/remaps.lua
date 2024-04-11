
-- Global mappings
-- :help vim.diagnostic.*

-- Open diagnostics floating window.
vim.keymap.set("n", "df", vim.diagnostic.open_float)

-- Toggle diagnostics.
vim.keymap.set(
  "n", "<leader>dt",
  function()
    if vim.diagnostic.is_disabled() then
      vim.diagnostic.enable()
      vim.notify(
        "Diagnostics enabled",
        vim.log.levels.INFO, {
          title = "[LSP]"
        }
      )
    else
      vim.diagnostic.disable()
      vim.notify(
        "Diagnostics disabled",
        vim.log.levels.INFO, {
          title = "[LSP]"
        }
      )
    end
  end
)

-- Open diagnostics location window.
vim.keymap.set(
  "n", "gl",
  function()
    local location = vim.fn.getloclist(0, { winid = 0 })
    if location.winid == 0 then
      vim.diagnostic.setloclist()
    else
      vim.cmd.lclose()
    end
  end
)

-- Toggle diagnostics quickfix window.
vim.keymap.set(
  "n", "dq", -- <leader>qf
  function()
    local quickfix = vim.fn.getqflist({ winid = 0 })
    if quickfix.winid == 0 then
      vim.diagnostic.setqflist()
    else
      vim.cmd.cclose()
    end
  end
)

-- Go to previous/next error.
vim.keymap.set("n", "gp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "gl", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>co", vim.lsp.codelens.refresh)
vim.keymap.set("n", "<leader>ru", vim.lsp.codelens.run)

-- Buffer local mappings.
-- :help vim.lsp.*

-- Use LspAttach autocommand to only map the following keys after the language
-- server attaches to the current buffer.
vim.api.nvim_create_autocmd(
  "LspAttach", {
    group = vim.api.nvim_create_augroup(
      "UserLspConfig", {
        clear = true,
      }
    ),
    callback = function(event)
      local options = { buffer = event.buf }

      -- Enable completion triggered by <c-x><c-o>.
      vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- :help jump-motions
      -- :jumps :clearjumps CTRL-O CTRL-I
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, options)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, options)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, options)
      vim.keymap.set("n", "go", vim.lsp.buf.type_definition, options)
      vim.keymap.set("n", "gj", vim.lsp.buf.implementation, options) -- gi
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, options)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, options)

      vim.keymap.set(
        "n", "<leader>f",
        function()
          vim.lsp.buf.format({ async = true })
        end,
        options
      )

      vim.keymap.set(
        {"n", "v"}, "<leader>ca",
        function()
          vim.lsp.buf.code_action({
            -- filter = function(a) return a.isPreferred end,
            -- apply = true,
          })
        end,
        options
      )

      -- TODO

      -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, options)

      -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, options)

      -- vim.keymap.set("n", "<space>wl", function()
      --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, options)

      -- comment
      -- select functioon, block, etc.

    end,
  }
)

