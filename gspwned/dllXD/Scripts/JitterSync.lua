menu.add_check_box("Enable jitter sync")
local switch = true

local function createmove()
    if menu.get_bool("Enable jitter sync") and cmd.get_send_packet() == true then
        if switch then
            switch = false
        else
            switch = true
        end

        if switch then
            if menu.get_int("Antiaim.lby_type") > 0 and menu.get_key_bind_state(key_binds.double_tap) == false and menu.get_key_bind_state(key_binds.hide_shots) == false then
                menu.set_int("0Antiaim.desync_range", 1)
            else
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