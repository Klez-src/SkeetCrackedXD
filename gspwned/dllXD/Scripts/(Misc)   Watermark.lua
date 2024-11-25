menu.add_check_box("Enable")
menu.add_slider_int("X Co-ords", 0, engine.get_screen_width()-183 )
menu.add_slider_int("Y Co-ords", 0, engine.get_screen_height()-25 )
menu.add_color_picker("Menu Outline Colour [left]")
menu.add_color_picker("Menu Outline Colour [right]")
menu.add_color_picker("Menu Title Background Colour")
menu.add_color_picker("Menu Stats Background Colour")
menu.add_color_picker("Text Colour")
local font =  render.create_font("Verdana", 22, 600, true, false, false)
local font1 =  render.create_font("Verdana", 9, 600, true, false, false)



function MoveableMenu() 
    local x, y = menu.get_int("X Co-ords"), menu.get_int("Y Co-ords"), 0
    local colour = menu.get_color("Menu Outline Colour [left]")
    local colour2 = menu.get_color("Menu Outline Colour [right]")
    local backcolour = menu.get_color("Menu Title Background Colour")
    local statscolour = menu.get_color("Menu Stats Background Colour")
    local fontcolour = menu.get_color("Text Colour")           
    local clock = globals.get_time()
    local internet = tostring( globals.get_ping())
    local fps = tostring( globals.get_framerate())

    if menu.get_bool("Enable") then 
        render.draw_rect_filled_gradient(x, y, 183, 25, colour, colour2, 0)
        render.draw_rect_filled(x+2, y+2, 180, 22, statscolour)
        render.draw_rect_filled(x+2, y+2, 160, 22, backcolour)
        render.draw_rect_filled(x+2, y+2, 180, 22, statscolour)
        render.draw_text(font, x+3, y, fontcolour, "Gaymesense")
        render.draw_text(font1, x+140, y+3, fontcolour, clock)
        render.draw_text(font1, x+158, y+13, fontcolour, internet .. "ms")
        render.draw_text(font1, x+129, y+13, fontcolour, fps .. "fps")
  
    end
end


client.add_callback("on_paint", MoveableMenu)

