menu.add_check_box("Keybinds v3")
menu.add_check_box("Draw Key Binds")
menu.add_slider_int("Position X", 0, engine.get_screen_width())
menu.add_slider_int("Position Y", 0, engine.get_screen_height())
local font = render.create_font("Calibri", 17, 500, true, true, false)
local font1 = render.create_font("Calibri", 17, 500, true, true, false)


function DrawKL()
local offset = 1
local x, y, d = menu.get_int("Position X"), menu.get_int("Position Y"), 0
local r = math.floor(math.sin(globals.get_realtime() * 2) * 127 + 128)
local g = math.floor(math.sin(globals.get_realtime() * 2 + 2) * 127 + 128)
local b = math.floor(math.sin(globals.get_realtime() * 2 + 4) * 127 + 128)

if menu.get_bool("Draw Key Binds") then
render.draw_rect_filled(x, y, 250, 2, color.new(250, 200, 0, 200))
render.draw_rect_filled(x, y+2, 250, 20, color.new(000, 000, 0, 140))

render.draw_text_centered(font, x+125, y+13 , color.new(255, 255, 255), true, true, "keybinds ")

if(menu.get_key_bind_state(key_binds.legit_automatic_fire)) then
render.draw_text_centered(font1, x+125, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[holding] Auto-fire")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.legit_enable)) and menu.get_bool("Enable legit aim-key") then
render.draw_text_centered(font1, x+125, y60 + 20*offset, color.new(255, 255, 255), true, true, "[holding] Aim-Key")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.double_tap)) then
render.draw_text_centered(font1, x+125, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] doubletap")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.body_aim)) then
render.draw_text_centered(font1, x+125, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] Body Aim")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.damage_override)) then
render.draw_text_centered(font1, x+143, y+4 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] damage override")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.hide_shots)) then
render.draw_text_centered(font1, x+125, y+8 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] HideShots ")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.flip_desync)) then
render.draw_text_centered(font1, x+143, y+4 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] anti-aim inverter")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.manual_back)) then -- or menu.get_key_bind_state(key_binds.manual_left) or menu.get_key_bind_state(key_binds.manual_right))
render.draw_text_centered(font1, x+157, y+4 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] Manual Anti-Aim back")
offset = offset + 1
elseif(menu.get_key_bind_state(key_binds.manual_left)) then
render.draw_text_centered(font1, x+125, y+4 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] Manual Anti-Aim left")
offset = offset + 1
elseif(menu.get_key_bind_state(key_binds.manual_right)) then
render.draw_text_centered(font1, x+125, y+4 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] Manual Anti-Aim right")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.thirdperson)) then
render.draw_text_centered(font1, x+130, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] ThirdPerson")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.automatic_peek)) then
render.draw_text_centered(font1, x+125, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] AutoPeek")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.edge_jump)) then
render.draw_text_centered(font1, x+125, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] Edge Jump")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.fakeduck)) then
render.draw_text_centered(font1, x+125, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] Fake duck")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.slowwalk)) then
render.draw_text_centered(font1, x+125, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] slowwalk")
offset = offset + 1
end
if(menu.get_key_bind_state(key_binds.teleport_exploit)) then
render.draw_text_centered(font1, x+125, y+3 + 20*offset, color.new(255, 255, 255), true, true, "[toggled] AirStack")
offset = offset + 1
end
end
end
client.add_callback("on_paint", DrawKL)

--[[menu.get_key_bind_state(key_binds.manual_back)

legit_automatic_fire
legit_enable
dt
baim
dmg
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