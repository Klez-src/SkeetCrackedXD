-- Простоквашина
menu.add_slider_int("<- Lag Limit", 1, 50)
menu.add_slider_int("Lag Limit ->", 50, 100)
menu.add_slider_int("<- Inverted Lag Limit", 50, 100)
menu.add_slider_int("Inverted Lag Limit ->", 1, 50)
local sync = true
-- Flood NNчик
local function createmove()
		                                                        local LLL1 = menu.get_int("<- Lag Limit")
		                                                        local LLL2 = menu.get_int("Lag Limit ->")
		                                                        local RLL1 = menu.get_int("<- Inverted Lag Limit")
		                                                        local RLL2 = menu.get_int("Inverted Lag Limit ->")
-- Flood NNчик
	if cmd.get_send_packet() == true then
-- Flood NNчик
		if sync then
			sync = false
		else
			sync = true
		end
			if (menu.get_key_bind_state(key_binds.flip_desync)) then
		    if sync then
-- Flood NNчик
			menu.set_int("0Antiaim.desync_range", RLL1)
			menu.set_int("1Antiaim.desync_range", RLL1)
			menu.set_int("2Antiaim.desync_range", RLL1)
			menu.set_int("3Antiaim.desync_range", RLL1)
		else
			menu.set_int("0Antiaim.desync_range", RLL2)
			menu.set_int("1Antiaim.desync_range", RLL2)
			menu.set_int("2Antiaim.desync_range", RLL2)
			menu.set_int("3Antiaim.desync_range", RLL2)
			end
-- Flood NNчик		
-- Flood NNчик		
			else
-- Flood NNчик
		    if sync then
			menu.set_int("0Antiaim.desync_range", LLL1)
			menu.set_int("1Antiaim.desync_range", LLL1)
			menu.set_int("2Antiaim.desync_range", LLL1)
			menu.set_int("3Antiaim.desync_range", LLL1)
		else
			menu.set_int("0Antiaim.desync_range", LLL2)
			menu.set_int("1Antiaim.desync_range", LLL2)
			menu.set_int("2Antiaim.desync_range", LLL2)
			menu.set_int("3Antiaim.desync_range", LLL2)
			end
-- Flood NNчик
-- Flood NNчик
-- Flood NNчик
-- Flood NNчик
			end			
			end
end
client.add_callback("on_createmove", createmove)