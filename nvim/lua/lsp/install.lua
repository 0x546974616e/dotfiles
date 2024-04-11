
-- :help standard-path
-- :help base-directories
-- :help runtimepath (rtp)
-- :help packages

-- XDG Base Directory Specification:
-- https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
-- https://wiki.archlinux.org/title/XDG_Base_Directory

-- Config directory:
--   Where personal preferences and user configurations are stored (analogous
--   to the /etc/ directory). It can be locate with `stdpath("config")`.
-- Data directory:
--   Contains static resources and user shareable plugins (like /usr/share/)
--   under the `stdpath("data")/site` directory.

local directory = (
  vim.fn.stdpath("data")
  .. "/site/pack/common/start/"
  .. "nvim-lspconfig"
)

if not vim.uv.fs_stat(directory) then
  local notify = function(message)
    vim.notify(message, vim.log.levels.WARN)
  end

  -- Start off cloning nvim-lspconfig. I know it is a dumb way of installing
  -- packages but I don't want any packages/plugins manager. I prefer (so far)
  -- to handle every package and configuration myself to understand everything
  -- under the hood. The git-clone command below acts more as a reminder of what
  -- I've installed and how I did it.
  notify("Cloning nvim-lspconfig...")

  vim.system({
    "git",
    "clone",
    "--depth", "1",
    "https://github.com/neovim/nvim-lspconfig",
     directory,
  })

  -- :messages
  notify("Cloning nvim-lspconfig done.")
  notify("Please restart Neovim.")
end

