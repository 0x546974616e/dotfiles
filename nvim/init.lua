local load = function(mod)
  package.loaded[mod] = nil
  return require(mod)
end

-- :source $MYVIMRC
load("user")
load("lsp")

