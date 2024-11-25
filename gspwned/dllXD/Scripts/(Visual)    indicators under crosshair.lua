-- ui
menu.add_check_box("Enable indicators")
menu.add_check_box("Enable arrows")
menu.next_line()
menu.add_color_picker("Color of active arrows")
menu.add_color_picker("Color of active indicators")


-- font
local font = render.create_font("Segoi UI", 13, 400, true, true, true) -- u can change font of indicators here
local font_arrows = render.create_font("Arial", 30, 600, true, true, false)

-- vars
local screen_x,screen_y = engine.get_screen_width(),engine.get_screen_height()
local get_state, get_mode, s_width = menu.get_key_bind_state, menu.get_key_bind_mode, render.get_text_width
local count = 0
local distance = 12
local red_color = color.new(255,0,0) -- change it and color of inactive indicators be changed

-- main
local function GetColorFromBool(value, first_color, second_color)
    return value and first_color or second_color
end

local function middle(label, bind_name, x, y, color, font)

    local width = render.get_text_width(font, label)
   
    render.draw_text(font, x - (width / 2), y + distance + (12 * count), GetColorFromBool(get_state(bind_name), color, red_color), label)
   
    count = count + 1

end


local function on_paint()
   
    if not menu.get_bool("Enable indicators") then return end
   
    local color_arrows = menu.get_color("Color of active arrows")
    local color_ind = menu.get_color("Color of active indicators")
   
    if menu.get_bool("Enable arrows") then
   
        render.draw_text(font_arrows, screen_x/2 - 45 - (s_width(font_arrows, "<")/2), screen_y/2 - 14, GetColorFromBool(get_state(key_binds.manual_left), color_arrows, color.new(255,255,255)), "<") -- "color.new(255,255,255)" change it and color of inactive arrows be changed
        render.draw_text(font_arrows, screen_x/2 + 45 - (s_width(font_arrows, ">")/2), screen_y/2 - 14, GetColorFromBool(get_state(key_binds.manual_right), color_arrows, color.new(255,255,255)), ">")
        render.draw_text(font_arrows, screen_x/2 - (s_width(font_arrows, "?")/2), screen_y/2 + 20, GetColorFromBool(get_state(key_binds.manual_back), color_arrows, color.new(255,255,255)), "?")
   
        distance = 50
   
    else
   
        distance = 12
       
    end
   
    render.draw_text(font, 100, 100, color.new(255, 255, 255), tostring(menu.get_int("Antiaim.lby_type")))
    count = 0
   
    middle("SW", key_binds.slowwalk, screen_x/2, screen_y/2, color_ind, font)
    middle("FB", key_binds.body_aim, screen_x/2, screen_y/2, color_ind, font)
    middle(get_state(key_binds.flip_desync) and "RIGHT" or "LEFT", key_binds.flip_desync, screen_x/2, screen_y/2, red_color, font)
    -- u can add ur bind here
end

-- callbacks
client.add_callback("on_paint", on_paint)