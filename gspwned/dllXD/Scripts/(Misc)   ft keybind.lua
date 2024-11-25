menu.add_check_box("Key Bind")
menu.add_slider_int("Horizontal Position", 0, engine.get_screen_width())
menu.add_slider_int("Vertical Position", 0, engine.get_screen_height())
local fontType = render.create_font("Arial Black", 20, 600, true, true, true)
local fontType2 = render.create_font("Arial Black", 18, 600, true, true, true)

local function draw()
    local offset = 1;
    if menu.get_bool("Key Bind") then
        local x,y = menu.get_int("Horizontal Position"),menu.get_int("Vertical Position")
        render.draw_rect_filled(x, y, 250, 5, color.new(220, 0, 255))
        render.draw_rect_filled(x, y+5, 250, 30, color.new(29, 27, 64))
        render.draw_rect_filled(x, y+30, 250, 5, color.new(220, 0, 255))
        render.draw_rect_filled(x, y+36, 250, 170, color.new(29, 27, 64))
        render.draw_text_centered(fontType2, x+122, y+20, color.new(220, 0, 255), true, true, "KeyBind")
        
        if(menu.get_key_bind_state(key_binds.double_tap)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "DT")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.body_aim)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "BAIM")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.damage_override)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "MIN DMG")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.hide_shots)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "Hide Shots")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.flip_desync)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "AA Invert")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.manual_back)) then  -- or menu.get_key_bind_state(key_binds.manual_left) or menu.get_key_bind_state(key_binds.manual_right))
           render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "BACK AA")
           offset = offset + 1
           elseif(menu.get_key_bind_state(key_binds.manual_left)) then
           render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "LEFT AA")
           offset = offset + 1
           elseif(menu.get_key_bind_state(key_binds.manual_right)) then
           render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "RIGHT AA")
           offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.thirdperson)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "Third Person")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.automatic_peek)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "Auto Peek")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.edge_jump)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "Edge Jump")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.fakeduck)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "Fake Duck")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.slowwalk)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "Slow Walk")
            offset = offset + 1
        end
        if(menu.get_key_bind_state(key_binds.teleport_exploit)) then
            render.draw_text_centered(fontType, x+122, y+25 + 25*offset, color.new(220, 0, 255), true, true, "Teleport Exploit")
            offset = offset + 1
        end
    end   
end

client.add_callback("on_paint", draw)

--[[menu.get_key_bind_state(key_binds.manual_back)

legit_automatic_fire
legit_enable
double_tap
body_aim
damage_override
hide_shots
manual_back
manual_left
manual_right
flip_desync
thirdperson
automatic_peek
edge_jump
fakeduck
slowwalk
teleport_exploit ]]