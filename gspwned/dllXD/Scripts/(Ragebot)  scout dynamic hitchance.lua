menu.add_check_box("Enable dynamick-hitchance")
local switch = true
local function createmove()
    if menu.get_bool("Enable dynamick-hitchance") and cmd.get_send_packet() == true then
        if switch then
            switch = false
        else
            switch = true
        end

        if switch then

           menu.set_int("5Ragebot.hitchance_amount", 85)
        else
           menu.set_int("5Ragebot.hitchance_amount", 75)

        end
    end
end

client.add_callback("on_createmove", createmove)
