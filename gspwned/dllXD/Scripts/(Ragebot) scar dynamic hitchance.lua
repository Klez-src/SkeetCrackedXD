menu.add_check_box("Enable scar-dynamick-hitchance")
local switch = true
local function createmove()
    if menu.get_bool("Enable scar-dynamick-hitchance") and cmd.get_send_packet() == true then
        if switch then
            switch = false
        else
            switch = true
        end

        if switch then

           menu.set_int("4Ragebot.hitchance_amount", 45)
        else
           menu.set_int("4Ragebot.hitchance_amount", 70)

        end
    end
end

client.add_callback("on_createmove", createmove)
