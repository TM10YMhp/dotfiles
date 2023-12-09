flexprompt.settings.style = "lean"
flexprompt.settings.frame_color = {
  "0", -- frame color
  "0", -- background color
  "0", -- text color
  "0", -- separator color
}
flexprompt.settings.charset = "ascii"
flexprompt.settings.lines = "two"
flexprompt.settings.use_icons = false
flexprompt.settings.use_home_tilde = true
flexprompt.settings.connection = "disconnected"
flexprompt.settings.spacing = "sparse"
flexprompt.settings.flow = "concise"
flexprompt.settings.left_prompt = "{time:format=[%y.%m%d.%H%M|%S]}{git:nountracked:nostaged:noaheadbehind}{cwd:type=full}"
flexprompt.settings.right_prompt = ""
flexprompt.settings.symbols.prompt = ">"
flexprompt.settings.prompt_symbol_color = "0"
flexprompt.settings.lean_separators = " "
flexprompt.defaultargs["time"] = "color=0"
flexprompt.defaultargs["git"] = "color=0:clean=0:conflict=0:dirty=0:remote=0:staged=0:unknown=0:unpublished=0"
flexprompt.defaultargs["cwd"] = "color=0,0:rootcolor=0"
flexprompt.settings.use_color_emoji = false
