menu.add_check_box("Enable awp-dynamick-accuracy")
local switch = true
local function createmove()
    if menu.get_bool("Enable awp-dynamick-accuracy") and cmd.get_send_packet() == true then
        if switch then
            switch = false
        else
            switch = true
        end

        if switch then

           menu.set_int("6Ragebot.accuracy_boost_amount", 50)
        else
           menu.set_int("6Ragebot.accuracy_boost_amount", 70)

        end
    end
end

client.add_callback("on_createmove", createmove)
