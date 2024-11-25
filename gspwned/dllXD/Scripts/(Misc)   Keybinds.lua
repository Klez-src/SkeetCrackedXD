menu.add_check_box("Draw Key Binds")
menu.add_check_box("Color")
menu.add_color_picker("Colorpicker")
menu.add_slider_int("Position X", 0, engine.get_screen_width())
menu.add_slider_int("Position Y", 0, engine.get_screen_height())

local font = render.create_font("Ariel", 15, 300, true, true, false)
local font1 = render.create_font("Tahoma", 14, 400, true, true, false)


function DrawKL()
    local offset = 1
    local x, y, d = menu.get_int("Position X"), menu.get_int("Position Y"), 0
    local r = math.floor(math.sin(globals.get_realtime() * 2) * 127 + 128)
    local g = math.floor(math.sin(globals.get_realtime() * 2 + 2) * 127 + 128)
    local b = math.floor(math.sin(globals.get_realtime() * 2 + 4) * 127 + 128)



    if menu.get_bool("Draw Key Binds") then
        render.draw_rect_filled(x, y+1.5, 160, 20, color.new(35, 33, 32, 245))
        render.draw_rect_filled(x, y+1.5, 160, 2, menu.get_color("Colorpicker"))


        
        render.draw_text_centered(font, x+73, y+12 , color.new(255, 255, 255), true, true, "            Hotkey List          ")
        if(menu.get_key_bind_state(key_binds.double_tap)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "Double-Tap")
            offset = offset + 1       
        end
        if(menu.get_key_bind_state(key_binds.body_aim)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "Baim")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.damage_override)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "MinDmg")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.hide_shots)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "HideShots")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.flip_desync)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "Invert desync[toggle]")
            offset = offset + 1
            else
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "Invert desync[off]")
            offset = offset + 1            
        end
        if(menu.get_key_bind_state(key_binds.thirdperson)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "ThirdPerson")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.automatic_peek)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "AutoPeek")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.edge_jump)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "Edge Jump")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.fakeduck)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "Fakeduck")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.slowwalk)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "Slowwalk")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.teleport_exploit)) then
            render.draw_text_centered(font1, x+75, y+17 + 18*offset, color.new(255, 255, 255), true, true, "Teleport Exploit")
            offset = offset + 1


        end
    end   
end
client.add_callback("on_paint", DrawKL)