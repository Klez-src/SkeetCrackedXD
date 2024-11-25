menu.add_check_box("Miss counter")
menu.add_check_box("Include spread")
menu.add_slider_int("[counter] X", 0, engine.get_screen_width())
menu.add_slider_int("[counter] Y", 0, engine.get_screen_height())

local hits, miss = 0, 0
local font = render.create_font("Verdana", 25, 900, true, true, false)

function shot(shot_info)
    local result = shot_info.result

    if result == "Resolver" then
        miss = miss + 1
    elseif result == "Spread" and menu.get_bool("Include spread") then
        miss = miss + 1
    elseif result == "Hit" then
        hits = hits + 1
    end
end


function paint()
    if menu.get_bool("Miss counter") then  
            local misses = "MISSES:" .. tostring(miss)
            local hit = "HITS:" .. tostring(hits)
            local percent_number = math.floor((miss / (hits + miss)) * 100 + 0.5)
            local percent = tostring(100 - percent_number) .. "%% HITS"
           
            local x = menu.get_int("[counter] X")
            local y = menu.get_int("[counter] Y")
           
            render.draw_text(font, x, y, color.new(230, 30, 30, 255), misses)
            render.draw_text(font, x, y + 17, color.new(30, 230, 30, 255), hit)
            if miss > 0 and hits > 0 then
                render.draw_text(font, x, y + 34, color.new(255, 255, 255, 255), percent)
            end
    end
end

client.add_callback("on_shot", shot)
client.add_callback("on_paint", paint)