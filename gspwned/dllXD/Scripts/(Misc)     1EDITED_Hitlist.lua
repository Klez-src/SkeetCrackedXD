menu.add_check_box("Enable shot list")
menu.add_slider_int("Height", 1, 16)
menu.add_slider_int("Shot list position X", 0, engine.get_screen_width())
menu.add_slider_int("Shot list position Y", 0, engine.get_screen_height())

local id = 0
local font = render.create_font("Smallest Pixel-7", 11, 100, true, true, true)

local aim_table =
{

}

local function shot(shot_info)
    for i = menu.get_int("Height"), 2, -1 do
        aim_table[i] = aim_table[i-1]
    end
    local hitbox1 = shot_info.client_hitbox
    local damage1 = shot_info.client_damage

    if hitbox1 == "None" then
        hitbox1 = "MISS"
    end
    local damage = shot_info.server_damage

    if damage == 0 then
        damage = "MISS"
    end
    if damage1 == 0 then
        damage1 = "MISS"
    end


    local backtrack = shot_info.backtrack_ticks

    if backtrack == 0 then
        backtrack = "-"
    else
        backtrack = backtrack .. " ticks"
    end

    local hitbox = shot_info.server_hitbox

    if hitbox == "None" then
        hitbox = "MISS"
    end

    local result = shot_info.result

    if result == "Hit" then
        result = "-"
    else
        hitbox = shot_info.client_hitbox
    end

    id = id + 1;

    aim_table[1] =
    {
        ["id"] = id,
        ["player"] = string.sub(shot_info.target_name, 0, 7),
        ["dmg"] = damage,
        ["dmg1"] = damage1,
        ["bt"] = backtrack,
        ["box"] = hitbox,
        ["box1"] =  hitbox1,
        ["rs"] = result
    }
end


local function draw_table(count, x, y, data)
    if data then
        local y = y + 4
        local pitch = x + 10
        local yaw = y + 15 + count * 16
        local r, g, b = 0, 0, 0
 
        if data.rs == "-" then
            r, g, b = 94, 230, 75
        elseif data.rs == "Resolver" then
            r, g, b = 245, 127, 23
        else
            r, g, b = 118, 171, 255
        end

        render.draw_rect_filled(x, yaw, 3, 15, color.new(r, g, b, 255))
        render.draw_text(font, pitch - 3, yaw + 1, color.new(255, 255, 255, 255), tostring(data.id))
        render.draw_text(font, pitch + 16, yaw + 1, color.new(255, 255, 255, 255), tostring(data.player))
        render.draw_text(font, pitch + 233, yaw + 1, color.new(255, 255, 255, 255), tostring(data.bt))
       
        render.draw_text(font, pitch + 290, yaw + 1, color.new(209, 228, 34, 255), tostring(data.rs))        
        if data.box == data.box1 then
            render.draw_text(font, pitch + 130, yaw + 2,color.new(0, 255, 0, 255), tostring(data.box))
            render.draw_text(font, pitch + 181, yaw + 1, color.new(0, 255, 0, 255), tostring(data.box1))
        else
            render.draw_text(font, pitch + 130, yaw + 2, color.new(0, 255, 0, 255), tostring(data.box))
            render.draw_text(font, pitch + 181, yaw + 1, color.new(255, 0, 0, 255), tostring(data.box1))
        end
        if data.dmg == data.dmg1 then
            render.draw_text(font, pitch + 60, yaw + 1, color.new(0, 255, 0, 255), tostring(data.dmg))
            render.draw_text(font, pitch + 90, yaw + 1, color.new(0, 255, 0, 255), tostring(data.dmg1))
        else
            render.draw_text(font, pitch + 60, yaw + 1, color.new(0, 255, 0, 255), tostring(data.dmg))
            render.draw_text(font, pitch + 90, yaw + 1, color.new(255, 0, 0, 255), tostring(data.dmg1))
        end
       

       
       


        return count + 1
    end
end

local function paint()
    if menu.get_bool("Enable shot list") then
        local x, y, d = menu.get_int("Shot list position X"), menu.get_int("Shot list position Y"), 0
        local n = menu.get_int("Height")
        local col_sz = 23 + 16 * (#aim_table > n and n or #aim_table)

        local r = math.floor(math.sin(globals.get_realtime() * 2) * 127 + 128)
        local g =  math.floor(math.sin(globals.get_realtime() * 2 + 2) * 127 + 128)
        local b = math.floor(math.sin(globals.get_realtime() * 2 + 4) * 127 + 128)

        if id > 0 then
            render.draw_rect_filled(x, y, 340, col_sz, color.new(22, 20, 26, 100))
        else
            render.draw_rect_filled(x, y, 340, 15, color.new(22, 20, 26, 100))
        end

        render.draw_rect_filled(x, y, 340, 15, color.new(16, 22, 29, 160))
        render.draw_rect_filled(x, y, 340, 2, color.new(r, g, b, 160)) -- 2 340
        render.draw_text(font, x + 7, y + 3, color.new(255, 255, 255, 255), "ID")
        render.draw_text(font, x + 26, y + 3, color.new(255, 255, 255, 255), "PLAYER")
        render.draw_text(font, x + 70, y + 3, color.new(255, 255, 255, 255), "DMG")
        render.draw_text(font, x + 190, y + 3, color.new(255, 255, 255, 255), "FIRED_ON")
        render.draw_text(font, x + 100, y + 3, color.new(255, 255, 255, 255), "DMG(c)")
        render.draw_text(font, x + 140, y + 3, color.new(255, 255, 255, 255), "HITBOX")
        render.draw_text(font, x + 242, y + 3, color.new(255, 255, 255, 255), "BACKTRACK")
        render.draw_text(font, x + 300, y + 3, color.new(255, 255, 255, 255), "REASON")

        for i = 1, menu.get_int("Height"), 1 do
            d = draw_table(d, x, y, aim_table[i])
        end
    end
end

client.add_callback("on_shot", shot)
client.add_callback("on_paint", paint)