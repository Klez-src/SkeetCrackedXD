menu.add_check_box("Enable scar autowall")
local switch = true
local function createmove()
    if menu.get_bool("Enable scar autowall") and cmd.get_send_packet() == true then
        if switch then
            switch = false
        else
            switch = true
        end

        if switch then

           menu.set_int("4Ragebot.minimum_damage", 24)
        else
           menu.set_int("4Ragebot.minimum_damage", 8)

        end
    end
end

client.add_callback("on_createmove", createmove)
