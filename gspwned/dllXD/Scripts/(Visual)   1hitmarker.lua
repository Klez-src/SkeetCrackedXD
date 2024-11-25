-- Made by kust1k & Lazarus

-- UI
menu.add_slider_int("Line Size", 1, 10)
menu.add_slider_int("Line Distance", 0, 10)

-- Lua Vars
local disabletime = 0
local hitmarkerTime = 0
local screen_x, screen_y = engine.get_screen_width(),engine.get_screen_height()

-- Function 1
local function hurt_function(info)
    if info.result ~= "Hit" then return end
    
    local get_timer = 0.6
    
    hitmarkerTime = get_timer

    disabletime = globals.get_realtime() + get_timer
        
end
-- Function 2
local function draw_hitmarker()

    local get_size = menu.get_int("Line Size")
    local get_distance = menu.get_int("Line Distance")

    if disabletime < globals.get_realtime() then return end

    local a = get_distance
    local c = disabletime - globals.get_realtime()
    local p = 255 * (disabletime - globals.get_realtime()) / hitmarkerTime
    local b = a + get_size
        
    render.draw_line(screen_x / 2 - b, screen_y / 2 - b, screen_x / 2 - a, screen_y / 2 - a, color.new(200, 200, 200, math.floor(p))) -- left upper
    render.draw_line(screen_x / 2 - b, screen_y / 2 + b, screen_x / 2 - a, screen_y / 2 + a, color.new(200, 200, 200, math.floor(p))) -- left down
    render.draw_line(screen_x / 2 + b, screen_y / 2 + b, screen_x / 2 + a, screen_y / 2 + a, color.new(200, 200, 200, math.floor(p))) -- right down
    render.draw_line(screen_x / 2 + b, screen_y / 2 - b, screen_x / 2 + a, screen_y / 2 - a, color.new(200, 200, 200, math.floor(p))) -- right upper
    
end


-- Callbacks
client.add_callback("on_shot", hurt_function)
client.add_callback("on_paint", draw_hitmarker)