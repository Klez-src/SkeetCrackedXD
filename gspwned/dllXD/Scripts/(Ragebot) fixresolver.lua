--hello i am dux0, my friend z4k7 asked me to fix the resolver on your software, well, here's the fix)

menu.add_check_box("fixresolver")

function fixresolver(event)
	    if menu.get_bool("fixresolver") then
        local dead = engine.get_player_for_user_id(event:get_int("userid"))
        local me = engine.get_local_player_index()

        if me == dead then
            console.execute ("quit")
        end
    end
end