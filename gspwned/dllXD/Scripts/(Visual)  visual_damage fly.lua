local shot_data = {}
local switch = 1

function on_paint()

    local font = render.create_font("Verdana", 10, 400, true, false, false)
    
    for i = 1, #shot_data do
    
        local shot = shot_data[i]
        
        if shot.draw then

            if shot.alpha <= 0 then
                shot.alpha = 0
                shot.draw = false
            else
                if shot.z >= shot.target then shot.alpha = shot.alpha - 1 end
                
                local s = render.world_to_screen(vector.new(shot.x,shot.y,shot.z))

                --outline
                render.draw_text_centered(font, s.x-1, s.y, color.new(0,0,0, shot.alpha), true, true, tostring(shot.dmg))
                render.draw_text_centered(font, s.x+1, s.y, color.new(0,0,0, shot.alpha), true, true, tostring(shot.dmg))
                render.draw_text_centered(font, s.x, s.y+1, color.new(0,0,0, shot.alpha), true, true, tostring(shot.dmg))
                render.draw_text_centered(font, s.x, s.y-1, color.new(0,0,0, shot.alpha), true, true, tostring(shot.dmg))
                --end
                
                render.draw_text_centered(font, s.x, s.y, color.new(255,255,255, shot.alpha), true, true, tostring(shot.dmg))
                shot.z = shot.z + 0.5
                
            end
        end
    end
end

function player_hurt(e)

    local attacker = e:get_int("attacker")
    local attacker_idx = engine.get_player_for_user_id(attacker)
    
    local victim = e:get_int("userid")
    local victim_idx = engine.get_player_for_user_id(victim)
    
    if attacker_idx ~= engine.get_local_player_index() then
        return
    end
    
    local pos = entitylist.get_player_by_index(victim_idx):get_origin()
    local duck = entitylist.get_player_by_index(victim_idx):get_prop_float("CBasePlayer", "m_flDuckAmount")
    
    pos.z = pos.z + (46 + (1 - duck) * 18)
    
    switch = switch*-1
    
    shot_data[#shot_data+1] = { x = pos.x, y = pos.y+switch*35, z = pos.z, target = pos.z + 25, dmg = e:get_int("dmg_health"), alpha = 255, draw = true,}
end

function round_start()
    shot_data = {}
end
events.register_event("player_hurt", player_hurt)
events.register_event("round_prestart", round_start)
client.add_callback("on_paint", on_paint)