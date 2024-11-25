menu.add_check_box("Enable jitter improve")
local switch = true

local function createmove()
    if cmd.get_send_packet() == true then
        if switch then
            switch = false
        else
            switch = true
        end

        if switch then
            if menu.get_int("Antiaim.lby_type") == 0 then
                menu.set_int("0Antiaim.desync_range", 50)
            end

            menu.set_int("1Antiaim.desync_range", 50)
            menu.set_int("2Antiaim.desync_range", 50)
            menu.set_int("3Antiaim.desync_range", 50)
        else
            menu.set_int("0Antiaim.desync_range", 100)
            menu.set_int("1Antiaim.desync_range", 100)
            menu.set_int("2Antiaim.desync_range", 100)
            menu.set_int("3Antiaim.desync_range", 100)
        end
    end
end

client.add_callback("on_createmove", createmove)