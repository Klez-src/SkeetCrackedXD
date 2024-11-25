menu.add_check_box("Enable low-delta")
local switch = true
local function createmove()
    if menu.get_bool("Enable low-delta") and cmd.get_send_packet() == true then
        if switch then
            switch = false
        else
            switch = true
        end

        if switch then

           menu.set_int("1Antiaim.desync_range", 45)
        else
           menu.set_int("1Antiaim.desync_range", 55)

        end
    end
end

client.add_callback("on_createmove", createmove)
