return {
  "pyright",
  setup = function(lspconfig)
    return {
      root_dir = lspconfig.util.root_pattern(
        ".git",
        "setup.py",
        "setup.cfg",
        "pyproject.toml",
        "requeriments.txt",
        "pyrightconfig.json"
      ),
      settings = {
        python = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            --diagnosticMode = "openFilesOnly",
            --typeCheckingMode = "off",
            useLibraryCodeForTypes = true,
          }
        }
      }
    }
  end
}
