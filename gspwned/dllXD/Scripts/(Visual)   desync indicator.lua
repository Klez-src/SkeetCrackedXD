--#####################
--##                 ##
--##   made by CouZ  ##
--##                 ##
--#####################

--font
local font =  render.create_font("Verdana", 16, 600, true, true, true)

-- menu
menu.add_check_box("DSNC indicator")

menu.add_check_box("Use custom x,y")
menu.add_slider_int("right_X", 0, engine.get_screen_width())
menu.add_slider_int("right_Y", 0, engine.get_screen_height())

menu.add_slider_int("left_X", 0, engine.get_screen_width())
menu.add_slider_int("left_Y", 0, engine.get_screen_height())

menu.add_check_box("Use custom color")
menu.next_line()
menu.add_color_picker("Real color")
menu.add_color_picker("Desync color")

-- render
local function draw()
if menu.get_bool("DSNC indicator") then
-- locals 
    local x = menu.get_int("right_X")
    local y = menu.get_int("right_Y")

    local x2 = menu.get_int("left_X")
    local y2 = menu.get_int("left_Y")
   
    local Real = menu.get_color("Real color")
    local Desync = menu.get_color("Desync color")

-- Anime?
    if not menu.get_bool("Use custom x,y") and not menu.get_bool("Use custom color") then
	
        render.draw_text(font, 931, 530, color.new(0, 255, 0), "<")
        render.draw_text(font, 977, 530, color.new(0, 255, 0), ">")

            if menu.get_key_bind_state(key_binds.flip_desync) then
                render.draw_text(font, 977, 530, color.new(255, 0, 0), ">")
	        else
	            render.draw_text(font, 931, 530, color.new(255, 0, 0), "<")
            end
    end
	
	
	if menu.get_bool("Use custom x,y") and not menu.get_bool("Use custom color") then
	
	    render.draw_text(font, x, y, color.new(0, 255, 0), "<")
        render.draw_text(font, x2, y2, color.new(0, 255, 0), ">")

            if menu.get_key_bind_state(key_binds.flip_desync) then
                render.draw_text(font, x2, y2, color.new(255, 0, 0), ">")
	        else
	            render.draw_text(font, x, y, color.new(255, 0, 0), "<")
            end
    end	
	
	if not menu.get_bool("Use custom x,y") and menu.get_bool("Use custom color") then
	
	    render.draw_text(font, 931, 530, Real, "<")
        render.draw_text(font, 977, 530, Real, ">")

            if menu.get_key_bind_state(key_binds.flip_desync) then
                render.draw_text(font, 977, 530, Desync, ">")
	        else
	            render.draw_text(font, 931, 530, Desync, "<")
            end
    end	

	if menu.get_bool("Use custom x,y") and menu.get_bool("Use custom color") then
	
	    render.draw_text(font, x, y, Real, "<")
        render.draw_text(font, x2, y2, Real, ">")

            if menu.get_key_bind_state(key_binds.flip_desync) then
                render.draw_text(font, x2, y2, Desync, ">")
	        else
	            render.draw_text(font, x, y, Desync, "<")
            end
    end	
end
-- function end
end
-- callback 
client.add_callback("on_paint", draw)