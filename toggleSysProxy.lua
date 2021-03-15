-- toggle system proxy  toggle Proxy is a function defined in .profile file
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", function()
  local output = hs.execute("/opt/bin/toggleSysProxy", false)
  hs.alert.show(output)
end)
