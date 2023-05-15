return {
  "tailwindcss",
  enabled = false,
  setup = function()
    return {
      settings = {
        tailwindCSS = {
          hovers = true,
          suggestions = false,
          emmetCompletions = false,
          colorDecorators = false,
          codeActions = false,
        }
      }
    }
  end
}
