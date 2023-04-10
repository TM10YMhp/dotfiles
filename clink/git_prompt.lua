function set_prompt()
  local current_date = os.date("%d%H%M|%S")
  local format_date = "["..current_date.."] "
  local user_home = clink.get_env("USERPROFILE")
  local current_directory = clink.get_cwd()

  local branch = ""
  --[[local _branch = io.popen("git branch 2>nul"):read("*a"):match("(.+)\n")
  if _branch then
    branch = "[".._branch.."] "
  end]]

  local prompt = format_date
    ..branch
    ..current_directory:gsub(user_home, "~")

  clink.prompt.value = prompt.."\n$ "
  return false;
end

clink.prompt.register_filter(set_prompt, 1)
