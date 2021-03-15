-- toggle system proxy
function toggle()  
  local output = hs.execute("/opt/bin/toggleSysProxy", false)
  hs.alert.show(output)
end

local mymodule = {}

-- bind to hotkeys to restart
-- obj.on({{"cmd", "alt", "ctrl"}, "P"})
function mymodule.on(keyspec)
  hs.hotkey.bindSpec(keyspec, function()
    toggle()
  end)
end

return mymodule
