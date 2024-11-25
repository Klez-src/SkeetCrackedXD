local function createmove()
local font = render.create_font("Howlfnt", 11, 100, true, true, true)
	if cmd.get_button_state(buttons.in_use) then
		menu.set_int("Antiaim.antiaim_type", 1)
	else
		menu.set_int("Antiaim.antiaim_type", 0)
		menu.set_int("Antiaim.desync", 1)
		menu.set_int("Antiaim.legit_lby_type", 1)
	end
end

client.add_callback("on_createmove", createmove)





