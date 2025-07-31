local function my_first_module(args) return "\n", "0" end
flexprompt.add_module("nl", my_first_module)

flexprompt = flexprompt or {}
flexprompt.settings = flexprompt.settings or {}

flexprompt.settings.style = "lean"
flexprompt.settings.frame_color = {
  "0", -- frame color
  "0", -- background color
  "0", -- text color
  "0", -- separator color
}
flexprompt.settings.use_color_emoji = false
flexprompt.settings.charset = "ascii"
flexprompt.settings.lines = "one"
flexprompt.settings.use_icons = false
flexprompt.settings.use_home_tilde = true
flexprompt.settings.connection = "disconnected"
flexprompt.settings.spacing = "sparse"
flexprompt.settings.flow = "concise"

flexprompt.settings.left_prompt = "{time}{python}{git}{cwd}{nl}"
flexprompt.settings.right_prompt = ""
flexprompt.settings.symbols.prompt = ">"
flexprompt.settings.prompt_symbol_color = "0"
flexprompt.settings.lean_separators = " "

flexprompt.defaultargs["time"] = table.concat({
  "color=0",
  "format=[%y.%m%d.%H%M|%S]",
}, ":")
flexprompt.defaultargs["git"] = table.concat({
  "color=0",
  "untracked",
  "nostaged",
  "noaheadbehind",
  "clean=0",
  "conflict=0",
  "dirty=0",
  "remote=0",
  "staged=0",
  "unknown=0",
  "unpublished=0",
}, ":")
flexprompt.defaultargs["python"] = "always:color=0"
flexprompt.defaultargs["cwd"] = "type=full:color=0,0:rootcolor=0"
