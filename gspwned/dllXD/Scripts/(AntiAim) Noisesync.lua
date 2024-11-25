menu.add_check_box("Enable noisesync")
menu.add_slider_int("Max noise delta", 1, 15)
menu.add_slider_int("Static desync centre", 1, 100)
menu.add_slider_int("Slowwalk desync centre", 1, 100)
menu.add_slider_int("Move desync centre", 1, 100)
menu.add_slider_int("Air desync centre", 1, 100)

local function createnoise()
    if menu.get_bool("Enable noisesync") and cmd.get_send_packet() == true then
    	local del = menu.get_int("Max noise delta")
        local random = math.random(0, 1)
        local cheker = true
        local a1 = menu.get_int("Static desync centre")
        local a2 = menu.get_int("Slowwalk desync centre")
        local a3 = menu.get_int("Move desync centre")
        local a4 = menu.get_int("Air desync centre")
        local d1 = math.random(1, del)
        local d2 = math.random(1, del)
        local d3 = math.random(1, del)
        local d4 = math.random(1, del)
        if random == 1 and cheker == true then
            cheker = false
            menu.set_int("0Antiaim.desync_range", a1+d1)
            menu.set_int("1Antiaim.desync_range", a2+d2)
            menu.set_int("2Antiaim.desync_range", a3+d3)
            menu.set_int("3Antiaim.desync_range", a4+d4)
        elseif random == 1 and cheker == true then
        	menu.set_int("0Antiaim.desync_range", a1)
        	menu.set_int("1Antiaim.desync_range", a2)
            menu.set_int("2Antiaim.desync_range", a3)
            menu.set_int("3Antiaim.desync_range", a4)
            cheker = true
        elseif random == 0 and cheker == false then
            menu.set_int("0Antiaim.desync_range", a1-d1)
            menu.set_int("1Antiaim.desync_range", a2-d2)
            menu.set_int("2Antiaim.desync_range", a3-d3)
            menu.set_int("3Antiaim.desync_range", a4-d4)
            cheker = true
        else
            menu.set_int("0Antiaim.desync_range", a1)
            menu.set_int("1Antiaim.desync_range", a2)
            menu.set_int("2Antiaim.desync_range", a3)
            menu.set_int("3Antiaim.desync_range", a4)
            cheker = false
        end
    end
end

client.add_callback("on_createmove", createnoise)




---made by Akvil