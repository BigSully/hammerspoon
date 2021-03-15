amphetamine = require "amphetamine"
-- safari = require "safari"
-- exportImage = require "exportImage"


toggleProxy = require "toggleSysProxy"
toggleProxy.on({{"cmd", "alt", "ctrl"}, "P"})


openconnect = require "openconnect"
openconnect.init()
openconnect.on({{"cmd", "alt", "ctrl"}, "V"})

-- reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)
hs.alert.show("Config reloaded")

