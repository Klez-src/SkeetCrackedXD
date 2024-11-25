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
                        "1 NN getting ddos on peek",
                        "Ops,1 u owned by Forever",
                        "$ uff yaa, 1 OTC user $",
                        "1 OTC user, otc dont work? Go download rapesense",
                        "1, owned by Forever",
                        "Owned by Legends",
                        "1 nn $Uff ya$",
                        "1 nice missed shot due to brain",
                        "1 упал ебать",
                        "куда летишь молодой,1",
                        "1 муровей нахуй"}
            randomNo = math.random (1,12)
         console.execute ("say " .. killtext[randomNo])
    end
end
end

events.register_event("player_death", killsay)



