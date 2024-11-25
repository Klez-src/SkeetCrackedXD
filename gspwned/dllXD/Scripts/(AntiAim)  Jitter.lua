-- Made by Immortale
--Edited by Citizen

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
                menu.set_int("0Antiaim.desync_range", 0)
            end

            menu.set_int("0Antiaim.range", 0)
            menu.sit_int("1Antiaim.desync_range", 0)
            menu.set_int("2Antiaim.desync_range", 0)
            menu.set_int("3Antiaim.desync_range", 0)
        else
            menu.set_int("0Antiaim.range", 35)
            menu.set_int("0Antiaim.desync_range", 25)
            menu.sit_int("1Antiaim.desync_range", 45)
            menu.set_int("2Antiaim.desync_range", 50)
            menu.set_int("3Antiaim.desync_range", 50)
        end
    end
end

menu.add_color_picker("Lua edited by Forever")

client.add_callback("on_createmove", createmove)

