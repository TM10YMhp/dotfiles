return {
  "pyright",
  setup = function(lspconfig)
    return {
      root_dir = function(fname)
        return lspconfig.util.root_pattern(
          ".git", "setup.py", "setup.cfg", "pyproject.toml", "requeriments.txt"
        )(fname) or lspconfig.util.path.dirname(fname)
      end,
      settings = {
        python = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            --diagnosticMode = "openFilesOnly"
            --typeCheckingMode = "off"
            useLibraryCodeForTypes = true,
          }
        }
      }
    }
  end
}
