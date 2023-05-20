return {
  "tailwindcss",
  enabled = false,
  setup = function()
    return {
      settings = {
        tailwindCSS = {
          hovers = true,
          suggestions = true,
          emmetCompletions = false,
          colorDecorators = false,
          codeActions = false,
        }
      }
    }
  end
}
