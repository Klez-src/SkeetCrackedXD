menu.add_check_box("Kill Say")

local randomNo
local killtext

function killsay(event)
    if menu.get_bool("Kill Say") then
        local attacker = engine.get_player_for_user_id(event:get_int("attacker"))
        local dead = engine.get_player_for_user_id(event:get_int("userid"))
        local me = engine.get_local_player_index()
        
        if attacker == me then
            killtext = {"Ops,look like otc not work #404 !",
                        "NN getting ddos on peek",
                        "Get good get in ass ##",
                        "Ops,owned in ass",
                        "$ uff yaa, 1 OTC user $",
                        "1 OTC user, otc dont work? Go download rapesense",
                        "Visit Discord server rapesense Free Joke Hack"}
            randomNo = math.random (1,7)
            console.execute ("say " .. killtext[randomNo])
        end
    end
end

events.register_event("player_death", killsay)