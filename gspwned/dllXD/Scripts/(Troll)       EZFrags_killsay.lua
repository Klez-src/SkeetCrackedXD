menu.add_check_box("Kill Say")

local randomNo
local killtext

function killsay(event)
    if menu.get_bool("Kill Say") then
    local attacker = engine.get_player_for_user_id(event:get_int("attacker"))
    local dead = engine.get_player_for_user_id(event:get_int("userid"))
    local me = engine.get_local_player_index()
        
        if attacker == me and dead ~= me then
        killtext = {"Visit gaymesense111.wixsite.com/websitefor the finest public & private CS:GO cheats",
        "Stop being a noob! Get good with gaymesense111.wixsite.com/website",
        "I'm not using gaymesense111.wixsite.com/website you're just bad",
        "You just got pwned by GAYMESENSE, the #1 CS:GO cheat",
        "If I was cheating, I'd use gaymesense111.wixsite.com/website",
        "Think you could do better? Not without gaymesense111.wixsite.com/website"}
        randomNo = math.random (1,6)
        console.execute ("say " .. killtext[randomNo])
        end
    end
end

events.register_event("player_death", killsay)





