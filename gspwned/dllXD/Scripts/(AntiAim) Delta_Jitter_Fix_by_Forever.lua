---- Fixed for V3 by fritata#4562
--inverted_desync_range int was added so had to change now it works on both sides ;), also changed max delta since the max desync is 58
--credits: https://legendware.pw/forum/threads/lagsync-easy-customization.1065/

-- Fixed for V3 by fritata#4562
menu.add_slider_int("Min Delta", 1, 58)
menu.add_slider_int("Max Delta", 1, 58)
menu.add_slider_int("Min Delta Inverted", 1, 58)
menu.add_slider_int("Max Delta Inverted", 1, 58)
local sync = true
local function createmove()
		                                                        local LLL1 = menu.get_int("Min Delta")
		                                                        local LLL2 = menu.get_int("Max Delta")
		                                                        local RLL1 = menu.get_int("Min Delta Inverted")
		                                                        local RLL2 = menu.get_int("Max Delta Inverted")
	if cmd.get_send_packet() == true then
		if sync then
			sync = false
		else
			sync = true
		end
			if (menu.get_key_bind_state(key_binds.flip_desync)) then
		    if sync then
-- Flood NNчик
			menu.set_int("0Antiaim.inverted_desync_range", LLL1)
			menu.set_int("1Antiaim.inverted_desync_range", LLL1)
			menu.set_int("2Antiaim.inverted_desync_range", LLL1)
			menu.set_int("3Antiaim.inverted_desync_range", LLL1)
		else
			menu.set_int("0Antiaim.inverted_desync_range", LLL2)
			menu.set_int("1Antiaim.inverted_desync_range", LLL2)
			menu.set_int("2Antiaim.inverted_desync_range", LLL2)
			menu.set_int("3Antiaim.inverted_desync_range", LLL2)
			end
-- -- Fixed for V3 by fritata#4562	
-- Flood NNчик		
			else
-- Flood NNчик
		    if sync then
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

			end			
			end
end
client.add_callback("on_createmove", createmove)

---- Fixed for V3 by fritata#4562
--inverted_desync_range int was added so had to change now it works on both sides ;), also changed max delta since the max desync is 58
--credits: https://legendware.pw/forum/threads/lagsync-easy-customization.1065/



