amphetamine = require "amphetamine"
-- safari = require "safari"
-- exportImage = require "exportImage"
toggleProxy = require "toggleSysProxy"

openconnect = require "openconnect"


-- reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
end)
hs.alert.show("Config reloaded")

