function printf(s,...)  print(s:format(...)) end

function fastExportImage()
    -- whether the pohtoshop is in focus
    local window = hs.window.focusedWindow()
    local app = window:application()
    local title = app:title()

    local isPhotoshop = title:find("Photoshop CC")
    if( not isPhotoshop ) then
        printf('invoke on %s, skip', title)
        return
    end

    -- click the menu item
    local str_export = {"File", "Export", "Quick Export as PNG"}
    app:selectMenuItem(str_export)

    -- whether the SAVE AS modal dialog has been presented
    local predicateFn = function() 
        local window = app:focusedWindow()
        local isSaveAs = window:title():find("Save As")

        if( not isSaveAs ) then
            printf("keep waiting, current window: %s", title)
        end

        return isSaveAs
    end

    -- add prefix to file name, and save
    local actionFn = function() 
        printf("action")
        hs.eventtap.event.newKeyEvent("left", true):post()
        hs.eventtap.event.newKeyEvent("left", false):post()

        -- break shirt + - into 4 event
        hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, true):post()
        hs.eventtap.event.newKeyEvent("-", true):post()
        hs.eventtap.event.newKeyEvent("-", false):post()
        hs.eventtap.event.newKeyEvent(hs.keycodes.map.shift, false):post()

        hs.eventtap.event.newKeyEvent("return", true):post()
        hs.notify.new({title="Hammerspoon", informativeText="Operation complete"}):send()
    end

    hs.timer.waitUntil(predicateFn, actionFn, 0.2)
end

hs.hotkey.bind({ "alt" }, 'E', fastExportImage)