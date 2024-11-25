-- Made by Pelle

menu.add_check_box("Enable line")
menu.add_slider_int("Line width", 1, 10)
menu.add_check_box("Custom color")
menu.next_line()
menu.add_color_picker("Color left")
menu.add_color_picker("Color right")

local function on_paint()
	if menu.get_bool("Enable line") then
		local line_width = menu.get_int("Line width")
		local screen_width = engine.get_screen_width()

		if menu.get_bool("Custom color") then
			render.draw_rect_filled_gradient(0, 0, screen_width, line_width, menu.get_color("Color left"), menu.get_color("Color right"), 0)
		else	
			local rect_width = screen_width / 5

			render.draw_rect_filled_gradient(0, 0, rect_width, line_width, color.new(255, 0, 0), color.new(255, 255, 0), 0)
			render.draw_rect_filled_gradient(rect_width, 0, rect_width, line_width, color.new(255, 255, 0), color.new(0, 255, 0), 0)
			render.draw_rect_filled_gradient(rect_width * 2, 0, rect_width, line_width, color.new(0, 255, 0), color.new(0, 255, 255), 0)
			render.draw_rect_filled_gradient(rect_width * 3, 0, rect_width, line_width, color.new(0, 255, 255), color.new(0, 0, 255), 0)
			render.draw_rect_filled_gradient(rect_width * 4, 0, rect_width, line_width, color.new(0, 0, 255), color.new(255, 0, 255), 0)
		end
	end
end

client.add_callback("on_paint", on_paint)