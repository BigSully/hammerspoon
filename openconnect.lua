local mymodule = {}

-- wather:start() to enable the listenging
function printf(s,...)  print(s:format(...)) end
wather = hs.caffeinate.watcher.new(function(eventType)    
    -- screensDidWake, systemDidWake, screensDidUnlock
    if eventType == hs.caffeinate.watcher.systemDidWake then
        -- Add the following line to /etc/sudoers to reduce password prompt of sudo /opt/bin/openconnect.sh
        -- %admin  ALL=(ALL) NOPASSWD: /opt/bin/openconnect.sh
        -- The reason nohup is used is that openconnect might output content to stdin continuously, which might make hammerspoon hung.
        local output = hs.execute("nohup sudo /opt/bin/openconnect.sh > /dev/null 2>&1 &", false)
        printf("openconnect restarted.")
        hs.notify.new({title="Openconnect", informativeText="openconnect restarted"}):send()
    end
end)

function mymodule.init()  wather:start() end

return mymodule
